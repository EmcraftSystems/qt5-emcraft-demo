TEMPLATE = app

QT += qml quick
SOURCES += main.cpp launcher.cpp
HEADERS += launcher.h

target.path = /usr/bin
qml.files = Qt5_EmcraftDemo.qml content
qml.path = /usr/share/Qt5_EmcraftDemo
INSTALLS += target qml
