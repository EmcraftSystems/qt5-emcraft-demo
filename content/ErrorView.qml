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
//    modality: Qt.WindowModal
    
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
        id: imageBGItem
	source: "images/errwin/error_fon.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: errIcon
	source: "images/errwin/error_icon.png"
	width: imageBGItem.height * 0.8
	height: imageBGItem.height * 0.8
	anchors.verticalCenter: imageBGItem.verticalCenter
	anchors.left: imageBGItem.left
	anchors.margins: 30
    }

    Image {
        id: closeImg
	source: "images/errwin/1icon.png"
	anchors.top: imageBGItem.bottom
	anchors.topMargin: 10
	anchors.right: imageBGItem.right

	MouseArea {
            anchors.fill: parent
	    onPressed: {
		closeImg.source = "images/errwin/2icon.png"
	    }
	    onReleased: {
		closeImg.source = "images/errwin/1icon.png"
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
	anchors.rightMargin: 30
	anchors.verticalCenter: imageBGItem.verticalCenter
        color: "#000000"
        style: Text.Raised
        styleColor: "#000000"
        font.pixelSize: settings.fontS
        wrapMode: Text.WordWrap
    }
}
