import QtQuick 2.0
import QtMultimedia 5.0

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
	vid.play()
//        showAnimation.restart();
    }
    function hide() {
	visible = false;
//        hideAnimation.restart();
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
	//anchors.fill: parent
	anchors.horizontalCenter: parent.horizontalCenter
	anchors.verticalCenter: parent.verticalCenter
	anchors.verticalCenterOffset: -40
	//z: 5
	source: "demo.mp4"
	//visible: false

	Image {
	    id: frame
	    width : parent.width/100*110
	    height : parent.height/100*140
	    z: -1
	    //anchors.fill: parent
	    anchors.horizontalCenter: parent.horizontalCenter
	    anchors.top: parent.top
	    anchors.topMargin: -80
	    source: "images/Video/fon_video.png"
	    visible: true
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
		    console.log("RUn: ", MediaPlayer.PlayingState)
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
	Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
	Keys.onLeftPressed: video.seek(video.position - 5000)
	Keys.onRightPressed: video.seek(video.position + 5000)
    }
}
