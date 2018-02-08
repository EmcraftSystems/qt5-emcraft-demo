import QtQuick 2.0
import QtGraphicalEffects 1.0
import "content"

Item {
    id: mainWindow

    property int curIdx: 0
    property variant items: menuModel
    
    width: 1920
    height: 1080
/*
    Background {
        id: background
    }

    Item {
    	id: leftItem
	visible: true
	x: parent.width / 2 - 400 - 400 / 2
	y: parent.height / 2 - 400 / 2
	width: 400
	height: 400

	Image {
	    id: imageLeft
	    anchors.fill: parent
	    source: "content/images/mainscreen/3D-Demo.png"
	    visible: false
	    opacity: 0.3
	}
	Rectangle {
	    anchors.fill: parent
	    color: "blue"
	    opacity: 0
	}

	GaussianBlur {
	    id: blurLeft
            anchors.fill: imageLeft
	    source: imageLeft
	    //maskSource: imageCenter
            radius: 16
	    samples: 16
            visible: true
            opacity: 1
	}
    }


    Item {
    	id: rightItem
	visible: true
	//anchors.verticalCenter: parent.verticalCenter
	//anchors.horizontalCenter: parent.horizontalCenter
	//anchors.horizontalCenterOffset: +400
	x: parent.width / 2 + 400 - 400 / 2
	y: parent.height / 2 - 400 / 2
	width: 400
	height: 400

	Image {
	    id: imageRight
	    anchors.fill: parent
	    source: "content/images/mainscreen/System-Info.png"
	    visible: false
	    opacity: 0.3
	}
	Rectangle {
	    anchors.fill: parent
	    color: "green"
	    opacity: 0
	}
	GaussianBlur {
	    id: blurRight
            anchors.fill: imageRight
	    source: imageRight
	    //maskSource: imageCenter
            radius: 16
	    samples: 16
            visible: true
            opacity: 1
	}
    }

    Item {
    	id: centerItem
	visible: true
	//anchors.verticalCenter: parent.verticalCenter
	//anchors.horizontalCenter: parent.horizontalCenter
	x: parent.width / 2 - 683 / 2
	y: parent.height / 2 - 725 / 2
	width: 683
	height: 725

	Image {
	    id: imageCenter
	    anchors.fill: parent
	    source: "content/images/mainscreen/Camera.png"
	    visible: false
	    opacity: 0.3
	}
	Rectangle {
	    id: centerRectangle
	    anchors.fill: parent
	    color: "red"
	    opacity: 0
	}

	GaussianBlur {
	    id: blurCenter
            anchors.fill: imageCenter
	    source: imageCenter
	    //maskSource: imageCenter
            radius: 0
	    samples: 16
            visible: true
            opacity: 1
	}
    }

    ParallelAnimation {
	id: ani
        running: true
	property int speed: 1000
        NumberAnimation { target: centerItem; property: "width"; to: 400; duration: ani.speed }
        NumberAnimation { target: centerItem; property: "height"; to: 400; duration: ani.speed }

        NumberAnimation { target: centerItem; property: "x"; to: mainWindow.width / 2 - 400 - 400 / 2; duration: ani.speed }
        NumberAnimation { target: centerItem; property: "y"; to: mainWindow.height / 2 - 400 / 2; duration: ani.speed }
        NumberAnimation { target: blurCenter; property: "radius"; to: 16; duration: ani.speed }
        NumberAnimation { target: rightItem; property: "width"; to: 683; duration: ani.speed }
        NumberAnimation { target: rightItem; property: "height"; to: 725; duration: ani.speed }
        NumberAnimation { target: rightItem; property: "x"; to: mainWindow.width / 2 - 683 / 2; duration: ani.speed }
        NumberAnimation { target: rightItem; property: "y"; to: mainWindow.height / 2 - 725 / 2; duration: ani.speed }
        NumberAnimation { target: blurRight; property: "radius"; to: 0; duration: ani.speed }
        NumberAnimation { target: leftItem; property: "x"; to: 0; duration: ani.speed }
        NumberAnimation { target: leftItem; property: "opacity"; to: 0; duration: ani.speed }

	onStopped: { 			
	    //imageCenter.source = "content/images/mainscreen/Camera_2.png"
	    //imageRight.source = "content/images/mainscreen/System-Info.png"
	}

    }
*/

    QtObject {
        id: settings
        // These are used to scale fonts according to screen size
        property real _scaler: 300 + mainWindow.width * mainWindow.height * 0.00015
        property int fontXS: _scaler * 0.032
        property int fontS: _scaler * 0.040
        property int fontM: _scaler * 0.046
        property int fontMM: _scaler * 0.064
        property int fontL: _scaler * 0.100
        // Settings
        property bool showFogParticles: true
        property bool showShootingStarParticles: true
        property bool showLighting: true
        property bool showColors: true
    }

    MainView {
        id: mainView
    }

    InfoView {
        id: infoView
    }

    DetailsView {
        id: detailsView
    }

    MoviesModel {
        id: moviesModel
    }

    ErrorView {
        id: errView
    }

    VideoPlay {
	id: video
    }

    FpsItem {
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
    }
}
