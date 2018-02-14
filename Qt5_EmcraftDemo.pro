TEMPLATE = app

QT += qml quick
SOURCES += main.cpp launcher.cpp
HEADERS += launcher.h

target.path = /opt/Qt5_EmcraftDemo
qml.files = Qt5_EmcraftDemo.qml content
qml.path = /opt/Qt5_EmcraftDemo
INSTALLS += target qml
