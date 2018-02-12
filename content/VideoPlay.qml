import QtQuick 2.0
import QtMultimedia 5.0

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
	vid.play()
    }
    function hide() {
	visible = false;
    }

    Rectangle {
	id: fon_video
	anchors.fill: parent
	color: "black"
	opacity: 0.5

	MouseArea {
            anchors.fill: parent
            onClicked: {
            }
	}
    }

    Video {
	id: vid
	width : parent.width/100*65
	height : parent.height/100*65
	anchors.horizontalCenter: parent.horizontalCenter
	anchors.verticalCenter: parent.verticalCenter
	anchors.verticalCenterOffset: -40
	source: "demo.mp4"

	Image {
	    id: frame
	    width : parent.width/100*110
	    height : parent.height/100*140
	    z: -1
	    anchors.horizontalCenter: parent.horizontalCenter
	    anchors.top: parent.top
	    anchors.topMargin: -80
	    source: "images/Video/fon_video.png"
	    visible: true
	}

	MouseArea {
	    id: fs_area
	    enabled: false
	    anchors.fill: parent
	    onClicked: {
		    if (!MediaPlayer.PlayingState) {
			vid.play()
		    } else {
			vid.stop()
			root.hide()
		    }
	    }
	}

	Image {
	    id: closeBtn
	    anchors.bottom: frame.bottom
	    anchors.bottomMargin: 60
	    anchors.horizontalCenter: frame.horizontalCenter

	    source: "images/errwin/ok1.png"
	    visible: true

	    MouseArea {
		anchors.fill: parent
		onPressed: {
		    closeBtn.source = "images/errwin/ok2.png"
		}
		onReleased: {
		    closeBtn.source = "images/errwin/ok1.png"
		}
		onClicked: {
		    if (!MediaPlayer.PlayingState) {
			vid.play()
		    } else {
			vid.stop()
			root.hide()
		    }
		}
	    }
	}

	focus: true
    }

    states : State {
	name: "fullscreen"
	PropertyChanges {
	    target: vid
	    anchors.fill: vid.parent
	    height: undefined
	    width: undefined
	}
	PropertyChanges {
	    target: fs_area
	    enabled: true
	}
	PropertyChanges {
	    target: closeBtn
	    enabled: false
	}
    }

}
