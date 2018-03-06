#include <QGuiApplication>
#include <QQuickView>
#include <launcher.h>
#include <fileio.h>
#include <serialio.h>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;

    qmlRegisterType<Launcher>("Launcher", 1, 0, "Process");
    qmlRegisterType<FileIO>("FileIO", 1, 0, "FileIO");
    qmlRegisterType<SerialIO>("SerialIO", 1, 0, "SerialIO");

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
