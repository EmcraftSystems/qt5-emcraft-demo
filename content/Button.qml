import QtQuick 2.0
import QtQuick.Particles 2.0

Item {
    id: root

    property alias text: buttonTextItem.text
    property bool effectsOn: true
    signal clicked

    width: buttonBackgroundImage.width
    height: buttonBackgroundImage.height
    scale: mouseArea.pressed && mouseArea.containsMouse ? 0.9 : 1.0
    opacity: mouseArea.pressed && mouseArea.containsMouse ? 0.8 : 1.0

    Behavior on scale {
        NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
    }
    Behavior on opacity {
        NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
    }

    Text {
        id: buttonTextItem
        anchors.centerIn: parent
        color: "#000000"
        font.pixelSize: 28
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.margins: -16
        onClicked: {
            root.clicked();
        }
    }
}
