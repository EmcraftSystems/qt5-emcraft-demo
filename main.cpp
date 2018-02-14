#include <QGuiApplication>
#include <QQuickView>
#include <launcher.h>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;

    qmlRegisterType<Launcher>("Launcher", 1, 0, "Process");

    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl::fromLocalFile(QLatin1String(
		    "/usr/share/Qt5_EmcraftDemo/Qt5_EmcraftDemo.qml")));

    const QString lowerArgument = QString::fromLatin1(argv[1]).toLower();
    if (lowerArgument == QLatin1String("--fullscreen")) {
        view.showFullScreen();
    } else {
        view.show();
    }
    return app.exec();
}
