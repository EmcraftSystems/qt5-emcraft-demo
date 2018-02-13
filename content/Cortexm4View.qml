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
        id: cortexm4BG
	source: "images/Cortex-M4 Demo/Cortex-M4 Demo.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter

	Text {
	    id: ping
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 425
	    y: 207
	    width: 180
	    height: 50
	    text: "0"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}
    }

    Image {
        id: closeImg
	source: "images/errwin/ok1.png"
	anchors.bottom: cortexm4BG.bottom
	anchors.bottomMargin: 80
	anchors.horizontalCenter: cortexm4BG.horizontalCenter

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

    Timer {
        interval: 1000; running: cortexm4View.isShown; repeat: true

        onTriggered: {
	    ping.text = parseInt(ping.text) + 1
	}
    }
}
