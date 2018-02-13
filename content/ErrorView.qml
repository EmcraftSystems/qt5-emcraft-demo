import QtQuick 2.0

BaseView {
    id: root
    
    property string text

    Image {
        id: bgimage
	source: "images/errwin/error_fon.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: errIcon
	source: "images/errwin/error_logo.png"
	anchors.top: bgimage.top
	anchors.left: bgimage.left
	anchors.margins: 100
    }

    Image {
        id: closeImg
	source: "images/errwin/ok1.png"
	anchors.bottom: bgimage.bottom
	anchors.bottomMargin: 80
	anchors.horizontalCenter: bgimage.horizontalCenter

	MouseArea {
            anchors.fill: parent
	    onPressed: {
		closeImg.source = "images/errwin/ok2.png"
	    }
	    onReleased: {
		closeImg.source = "images/errwin/ok1.png"
	    }
            onClicked: {
		errView.hide()
            }
	}
    }

    Text {
        id: textItem
	text: root.text
	anchors.left: errIcon.right
	anchors.leftMargin: 30
	anchors.right: bgimage.right
	anchors.rightMargin: 80
	anchors.top: bgimage.top
	anchors.topMargin: 110
        color: "white"
        //style: Text.Raised
        //styleColor: "#000000"
	font.family: "Arial"
        font.pixelSize: settings.fontS
        wrapMode: Text.WordWrap
    }
}
