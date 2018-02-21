import QtQuick 2.0

Rectangle {
    id: root

    anchors.fill: parent
    color: "#ffffff"

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "images/mainscreen/fon" + (settings.tv_mode ? "_tv.png" : ".png")
    }
}
