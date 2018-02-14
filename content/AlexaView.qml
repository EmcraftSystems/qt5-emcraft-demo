import QtQuick 2.0
import Launcher 1.0

BaseView {

    Image {
        id: bgimage
	source: "images/Alexa/background.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    Process {
	id: pexec
    }

    Text {
	id: alexa_note
	anchors.verticalCenter: bgimage.verticalCenter
	anchors.verticalCenterOffset: -64
	anchors.horizontalCenter: bgimage.horizontalCenter
	text: "Speak to Alexa...\n" + pexec.start_readAll("uname -a")
	color: "white"
	font.family: "Arial"
	font.pixelSize: 56
    }
}
