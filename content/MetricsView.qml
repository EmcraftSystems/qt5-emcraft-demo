import QtQuick 2.0
//import QtQuick.Controls 2.1
//import QtQuick.Dialogs

Item {
    id: root
    
    property string text
    property bool isShown: false

    //width: metricsBG.width
    //height: metricsBG.width
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
        id: metricsBG
	source: "images/Metrics/Metrics.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter

	Text {
	    id: fps
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 243
	    y: 283
	    width: 175
	    height: 50
	    text: "30"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}

	Text {
	    id: temp
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 243
	    y: 356
	    width: 175
	    height: 50
	    text: "59"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}

	Text {
	    id: cpu0
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 664
	    y: 278
	    width: 130
	    height: 50
	    text: "100%"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}

	Text {
	    id: cpu1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 664
	    y: 358
	    width: 130
	    height: 50
	    text: "2%"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}

	Text {
	    id: cpu2
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 664
	    y: 440
	    width: 130
	    height: 50
	    text: "100%"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}

	Text {
	    id: cpu3
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 664
	    y: 520
	    width: 130
	    height: 50
	    text: "100%"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}
    }

    Image {
        id: closeImg
	source: "images/errwin/ok1.png"
	anchors.bottom: metricsBG.bottom
	anchors.bottomMargin: 80
	anchors.horizontalCenter: metricsBG.horizontalCenter

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
        interval: 1000; running: metricsView.isShown; repeat: true
        onTriggered: {
	    fps.text = Math.floor(35 + 10 * Math.random())
	    temp.text = Math.floor(59 + 10 * Math.random())
	    cpu0.text = Math.floor(100 * Math.random()) + "%"
	    cpu1.text = Math.floor(100 * Math.random()) + "%"
	    cpu2.text = Math.floor(100 * Math.random()) + "%"
	    cpu3.text = Math.floor(100 * Math.random()) + "%"
	}
    }

    Text {
        id: textItem
	text: root.text
	anchors.left: errIcon.right
	anchors.leftMargin: 30
	anchors.right: metricsBG.right
	anchors.rightMargin: 80
	anchors.top: metricsBG.top
	anchors.topMargin: 110
        color: "white"
        //style: Text.Raised
        //styleColor: "#000000"
	font.family: "Arial"
        font.pixelSize: settings.fontS
        wrapMode: Text.WordWrap
    }
}
