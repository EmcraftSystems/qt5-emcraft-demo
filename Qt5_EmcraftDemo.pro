TEMPLATE = app

QT += qml quick quickcontrols2 serialport
SOURCES += main.cpp launcher.cpp fileio.cpp serialio.cpp
HEADERS += launcher.h fileio.h serialio.h

target.path = /usr/bin
qml.files = Qt5_EmcraftDemo.qml content
qml.path = /usr/share/Qt5_EmcraftDemo
INSTALLS += target qml
