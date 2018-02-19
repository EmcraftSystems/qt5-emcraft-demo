TEMPLATE = app

QT += qml quick
SOURCES += main.cpp launcher.cpp fileio.cpp
HEADERS += launcher.h fileio.h

target.path = /usr/bin
qml.files = Qt5_EmcraftDemo.qml content
qml.path = /usr/share/Qt5_EmcraftDemo
INSTALLS += target qml
