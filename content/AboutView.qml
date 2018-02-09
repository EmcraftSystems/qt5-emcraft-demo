import QtQuick 2.0
//import QtQuick.Controls 2.1
//import QtQuick.Dialogs

Item {
    id: root
    
    property string text
    property bool isShown: false

    //width: aboutBG.width
    //height: aboutBG.width
    anchors.fill: parent
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    visible: false
    
    function show() {
        mainView.scheduleUpdate();
        root.isShown = true;
	visible = true;
//        showAnimation.restart();
    }
    function hide() {
	visible = false;
//        hideAnimation.restart();
    }

    Rectangle {
	id: fon
	anchors.fill: parent
	color: "black"
	opacity: 0.5

	MouseArea {
            anchors.fill: parent
            onClicked: {
            }
	}
    }
    
    Image {
        id: aboutBG
	source: "images/About/about.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: closeImg
	source: "images/errwin/ok1.png"
	anchors.bottom: aboutBG.bottom
	anchors.bottomMargin: 80
	anchors.horizontalCenter: aboutBG.horizontalCenter

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

    Text {
        id: textItem
	text: root.text
	anchors.left: errIcon.right
	anchors.leftMargin: 30
	anchors.right: aboutBG.right
	anchors.rightMargin: 80
	anchors.top: aboutBG.top
	anchors.topMargin: 110
        color: "white"
        //style: Text.Raised
        //styleColor: "#000000"
	font.family: "Arial"
        font.pixelSize: settings.fontS
        wrapMode: Text.WordWrap
    }
}
