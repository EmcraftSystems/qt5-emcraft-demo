import QtQuick 2.0

Item {
    id: root
    
    property string text
    property bool isShown: false

    anchors.fill: parent
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    visible: false
    
    function show() {
        mainView.scheduleUpdate();
        root.isShown = true;
	visible = true;
    }
    function hide() {
	visible = false;
    }

    Rectangle {
	id: fon
	anchors.fill: parent
	color: "black"
	opacity: settings.modal_opacity

	MouseArea {
            anchors.fill: parent
            onClicked: {
            }
	}
    }
    
    Image {
        id: systemBG
	source: "images/System/sistem info.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: closeImg
	source: "images/errwin/ok1.png"
	anchors.bottom: systemBG.bottom
	anchors.bottomMargin: 80
	anchors.horizontalCenter: systemBG.horizontalCenter

	MouseArea {
            anchors.fill: parent
	    onPressed: {
		closeImg.source = "images/errwin/ok2.png"
	    }
	    onReleased: {
		closeImg.source = "images/errwin/ok1.png"
	    }
            onClicked: {
		root.hide()
            }
	}
    }
}
