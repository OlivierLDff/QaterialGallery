/**
 * \brief QaterialGallery Main File that:
 * - Initialiaze Qt
 * - Parse command line input
 * - Initialiaze PsnViewer
 * - Register useful type to QML
 * - Install Log Message Handler
 */

// ─────────────────────────────────────────────────────────────
//					INCLUDE
// ─────────────────────────────────────────────────────────────

// Qt
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QtQml>
#include <QFontDatabase>
#include <QDebug>

// Oliv Qt
#include <Qaterial.hpp>

// QaterialGallery
#include <QaterialGallery.hpp>

// ─────────────────────────────────────────────────────────────
//					DECLARATION
// ─────────────────────────────────────────────────────────────

#define QATERIALGALLERY_URI "QaterialGallery"

Q_LOGGING_CATEGORY(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "QaterialGallery")

int main(int argc, char *argv[])
{
	// It's important to set the high dip support before creating the gui app
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;

	// ────────── REGISTER APPLICATION ──────────────────────────────────────

	QGuiApplication::setOrganizationName("Oliv");
	QGuiApplication::setApplicationName("Qaterial Gallery");
	QGuiApplication::setOrganizationDomain("https://github.com/OlivierLDff/QaterialGallery");
	QGuiApplication::setApplicationVersion(Qqhg::Version::GetVersion());

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

	// ────────── SET QML FONT AND RESSOURCES ──────────

	QQuickStyle::setStyle(QStringLiteral("Material"));
	engine.addImportPath("qrc:///QaterialGallery/qml");
	engine.addImportPath("qrc:///");

	// ────────── REGISTER QML TYPE ────────────

	// QSM HELPER
	Qaterial::Utils::loadResources();
	Qaterial::Utils::registerTypes();

	// ────────── LOAD QML MAIN ───────────

	qCInfo(QATERIALGALLERY_MAIN_LOGGING_CATEGORY, "Qml Engine Load Main.qml");
	engine.load(QUrl("qrc:/QaterialGallery/qml/Main.qml"));
	if (engine.rootObjects().isEmpty())
		return -1;

	// ────────── START EVENT LOOP ──────────────────────────────────────
	return app.exec();
}
