import QtQuick 2.0
//import QtQuick.Controls 2.1
//import QtQuick.Dialogs

Item {
    id: root
    
    property string text
    property bool isShown: false

    //width: imageBGItem.width
    //height: imageBGItem.width
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
	opacity: settings.modal_opacity

	MouseArea {
            anchors.fill: parent
            onClicked: {
            }
	}
    }
    
    Image {
        id: imageBGItem
	source: "images/errwin/error_fon.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: errIcon
	source: "images/errwin/error_logo.png"
	//width: imageBGItem.height * 0.8
	//height: imageBGItem.height * 0.8
	anchors.top: imageBGItem.top
	anchors.left: imageBGItem.left
	anchors.margins: 100
    }

    Image {
        id: closeImg
	source: "images/errwin/ok1.png"
	anchors.bottom: imageBGItem.bottom
	anchors.bottomMargin: 80
	anchors.horizontalCenter: imageBGItem.horizontalCenter

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
	anchors.right: imageBGItem.right
	anchors.rightMargin: 80
	anchors.top: imageBGItem.top
	anchors.topMargin: 110
        color: "white"
        //style: Text.Raised
        //styleColor: "#000000"
	font.family: "Arial"
        font.pixelSize: settings.fontS
        wrapMode: Text.WordWrap
    }
}
