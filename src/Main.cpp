/**
 * \brief QaterialGallery Main File that:
 * - Initialiaze Qt
 * - Parse command line input
 * - Initialiaze PsnViewer
 * - Register useful type to QML
 * - Install Log Message Handler
 */

// ─────────────────────────────────────────────────────────────
//                  INCLUDE
// ─────────────────────────────────────────────────────────────

// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QtQml>
#include <QDebug>

// Oliv Qt
#include <Qaterial/Qaterial.hpp>

// spdlog
#ifdef WIN32
#include <spdlog/sinks/msvc_sink.h>
#endif
#include <spdlog/sinks/stdout_color_sinks.h>

// QaterialGallery
#include <QaterialGallery/QaterialGallery.hpp>

// ─────────────────────────────────────────────────────────────
//                  DECLARATION
// ─────────────────────────────────────────────────────────────

Q_LOGGING_CATEGORY(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "QaterialGallery")

void installLoggers()
{
#ifdef WIN32
    const auto msvcSink = std::make_shared<spdlog::sinks::msvc_sink_mt>();
    msvcSink->set_level(spdlog::level::debug);
    qaterial::Logger::registerSink(msvcSink);
#endif
    const auto stdoutSink = std::make_shared<spdlog::sinks::stdout_color_sink_mt>();
    stdoutSink->set_level(spdlog::level::debug);
    qaterial::Logger::registerSink(stdoutSink);
}

int main(int argc, char *argv[])
{
    installLoggers();

    // It's important to set the high dip support before creating the gui app
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // ────────── REGISTER APPLICATION ──────────────────────────────────────

    QGuiApplication::setOrganizationName("Oliv");
    QGuiApplication::setApplicationName("Qaterial Gallery");
    QGuiApplication::setOrganizationDomain("https://github.com/OlivierLDff/QaterialGallery");
    QGuiApplication::setApplicationVersion(qaterial::gallery::Version::GetVersion());

    qCDebug(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "Register Application: "
        "Organization: %s; "
        "Domain: %s; "
        "ApplicationName: %s; "
        "Version: %s",
        qPrintable(QGuiApplication::organizationName()),
        qPrintable(QGuiApplication::organizationDomain()),
        qPrintable(QGuiApplication::applicationName()),
        qPrintable(QGuiApplication::applicationVersion())
        );

    // ────────── COMMAND PARSER ──────────────────────────────────────

    QCommandLineParser parser;
    parser.setApplicationDescription("QaterialGallery is a gallery for the QML library Qaterial.");
    parser.addHelpOption();
    parser.addVersionOption();

    // Process the actual command line arguments given by the user
    parser.process(app);

    // ────────── PROCESS ARGS ──────────────────────────────────────

    const QStringList args = parser.positionalArguments();

    // ────────── SET QML FONT AND RESOURCES ──────────

    engine.addImportPath("qrc:///");

    // ────────── REGISTER QML TYPE ────────────

    // QSM HELPER
    qaterial::Utils::loadResources();
    qaterial::Utils::registerTypes();

    Q_INIT_RESOURCE(QaterialGallery);

    // ────────── LOAD QML MAIN ───────────

    qCInfo(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "Qml Engine Load Main.qml");
    engine.load(QUrl("qrc:/QaterialGallery/Main.qml"));
    if (engine.rootObjects().isEmpty())
    {
        qCWarning(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "Error : Fail to load Main.qml");
        return -1;
    }

    // ────────── START EVENT LOOP ──────────────────────────────────────
    return app.exec();
}
