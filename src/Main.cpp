// ──── INCLUDE ────

// Oliv Qt
#include <Qaterial/Qaterial.hpp>

// spdlog
#ifdef WIN32
#    include <spdlog/sinks/msvc_sink.h>
#endif
#include <spdlog/sinks/stdout_color_sinks.h>

// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QLibraryInfo>

// ──── DECLARATION ────

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

// ──── FUNCTIONS ────

int main(int argc, char* argv[])
{
#if defined(QATERIALGALLERY_IGNORE_ENV)
    const QString executable = argv[0];
#    if defined(Q_OS_WINDOWS)
    const auto executablePath = executable.mid(0, executable.lastIndexOf("\\"));
    QCoreApplication::setLibraryPaths({executablePath});
#    elif defined(Q_OS_LINUX)
    const auto executablePath = executable.mid(0, executable.lastIndexOf("/"));
    qWarning("executablePath %s", qPrintable(executablePath));
    //QCoreApplication::setLibraryPaths({executablePath + "/../plugins/", executablePath + "/../qml/"});
#    else
#    endif
#endif

    qWarning("QLibraryInfo::location(QLibraryInfo::PluginsPath) %s", qPrintable(QLibraryInfo::location(QLibraryInfo::PluginsPath)));

    installLoggers();

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // ──── REGISTER APPLICATION ────

    QGuiApplication::setOrganizationName("Oliv");
    QGuiApplication::setApplicationName("Qaterial Gallery");
    QGuiApplication::setOrganizationDomain("https://github.com/OlivierLDff/QaterialGallery");
    QGuiApplication::setApplicationVersion(qaterial::Version::version().readable());

    qCDebug(QATERIALGALLERY_MAIN_LOGGING_CATEGORY,
        "Register Application: "
        "Organization: %s; "
        "Domain: %s; "
        "ApplicationName: %s; "
        "Version: %s",
        qPrintable(QGuiApplication::organizationName()),
        qPrintable(QGuiApplication::organizationDomain()),
        qPrintable(QGuiApplication::applicationName()),
        qPrintable(QGuiApplication::applicationVersion()));

    // ──── LOAD AND REGISTER QML ────

#if defined(QATERIALGALLERY_IGNORE_ENV)
    engine.setImportPathList({QLibraryInfo::location(QLibraryInfo::Qml2ImportsPath), "qrc:/", "qrc:/qt-project.org/imports"});
#else
    engine.addImportPath("qrc:/");
#endif

    // Load Qaterial
    qaterial::loadQmlResources();
    qaterial::registerQmlTypes();

    // Load QaterialGallery
    Q_INIT_RESOURCE(QaterialGallery);

    // ──── LOAD QML MAIN ────

    qCInfo(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "Qml Engine Load Main.qml");
    engine.load(QUrl("qrc:/QaterialGallery/Main.qml"));
    if(engine.rootObjects().isEmpty())
    {
        qCWarning(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "Error : Fail to load Main.qml");
        return -1;
    }
    qCInfo(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "Start Qt Event Loop");

    // ──── START EVENT LOOP ────
    return QGuiApplication::exec();
}
