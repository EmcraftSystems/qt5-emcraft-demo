import QtQuick 2.0
import FileIO 1.0

BaseView {

    Image {
        id: bgimage
	source: "images/Alexa/alexa_frame.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    FileIO {
	id: fd
    }

    // activate alexa
    show_callback: "fd.writeFile(\"/run/alexa/fd\", \"t\\n\")"

    // stop alexa
    hide_callback: "fd.writeFile(\"/run/alexa/fd\", \"s\\n\")"
}
