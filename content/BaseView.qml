import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root
    
    property bool isShown: false

    anchors.fill: parent
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    visible: false
    
    function show() {
        mainView.scheduleUpdate();
        root.isShown = true;
	visible = true;
	mainView.act = false
    }
    function hide() {
	visible = false;
	mainView.act = true
    }

    FastBlur {
	anchors.fill: parent
	radius: 64
	source: mainView
    }

    Rectangle {
	id: fon
	anchors.fill: parent
	color: "black"
	opacity: 0.3

	MouseArea {
            anchors.fill: parent
            onClicked: {
            }
	}
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
		root.hide()
            }
	}
    }
}
