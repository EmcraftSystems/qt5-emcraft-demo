import QtQuick 2.0
//import QtQuick.Controls 2.1
//import QtQuick.Dialogs

Item {
    id: root
    
    property string text
    property bool isShown: false

    //width: settingsBG.width
    //height: settingsBG.width
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
        id: settingsBG
	source: "images/UI Settings/ui.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: closeImg
	source: "images/errwin/ok1.png"
	anchors.bottom: settingsBG.bottom
	anchors.bottomMargin: 80
	anchors.horizontalCenter: settingsBG.horizontalCenter

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
	anchors.right: settingsBG.right
	anchors.rightMargin: 80
	anchors.top: settingsBG.top
	anchors.topMargin: 110
        color: "white"
        //style: Text.Raised
        //styleColor: "#000000"
	font.family: "Arial"
        font.pixelSize: settings.fontS
        wrapMode: Text.WordWrap
    }
}
