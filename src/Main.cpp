/**
 * \brief PsnViewer Main File that:
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
#include <QQuickMaterialHelper.hpp>

// QQuickMaterialHelperGallery
#include <QQuickMaterialHelperGallery.hpp>

// ─────────────────────────────────────────────────────────────
//					DECLARATION
// ─────────────────────────────────────────────────────────────

#define QQUICKMATERIALHELPERGALLERY_URI "QQuickMaterialHelperGallery"

Q_LOGGING_CATEGORY(QQUICKMATERIALHELPERGALLERY_MAIN_LOGGING_CATEGORY, "qquickcontrols.qquickHelperGallery")

int main(int argc, char *argv[])
{
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;

	// ────────── REGISTER APPLICATION ──────────────────────────────────────

	QGuiApplication::setOrganizationName("Oliv");
	QGuiApplication::setApplicationName("QQuickMaterialHelperGallery");	
	QGuiApplication::setOrganizationDomain("www.qquickhelpergallery.com");
	QGuiApplication::setApplicationVersion(Qqhg::Version::GetVersion());

	qCDebug(QQUICKMATERIALHELPERGALLERY_MAIN_LOGGING_CATEGORY, "Register Application: "
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
	parser.setApplicationDescription("QQuickMaterialHelperGallery is a tool to control and and configure Dmx/Rdm Network.");
	parser.addHelpOption();
	parser.addVersionOption();

	// Process the actual command line arguments given by the user
	parser.process(app);

	// ────────── PROCESS ARGS ──────────────────────────────────────

	const QStringList args = parser.positionalArguments();

	// ────────── SET QML FONT AND RESSOURCES ──────────────────────────────────────

	QQuickStyle::setStyle(QStringLiteral("Material"));
	engine.addImportPath("qrc:///QQuickMaterialHelperGallery/qml");
	engine.addImportPath("qrc:///");

	// ────────── REGISTER QML TYPE ──────────────────────────────────────

	// QSM HELPER
	QQuickMaterialHelper::Helper::loadRessources();
	QQuickMaterialHelper::Helper::registerTypes();

	// ────────── LOAD QML MAIN ──────────────────────────────────────

	qCInfo(QQUICKMATERIALHELPERGALLERY_MAIN_LOGGING_CATEGORY(), "Qml Engine Load Main.qml");
	engine.load(QUrl("qrc:/QQuickMaterialHelperGallery/qml/Main.qml"));
	if (engine.rootObjects().isEmpty())
		return -1;

	// ────────── START EVENT LOOP ──────────────────────────────────────
	return app.exec();
}
