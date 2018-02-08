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
	//width : parent.width/100*70
	//height : parent.height/100*70
	anchors.fill: parent
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
	//z: 5
	source: "demo.mp4"
	//visible: false

	MouseArea {
	    anchors.fill: parent
	    onClicked: {
		console.log("RUn: ", MediaPlayer.PlayingState)
		if (!MediaPlayer.PlayingState) {
		    parent.play()
		} else {
		    parent.stop()
		    root.hide()
		}
	    }
	}

	focus: true
	Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
	Keys.onLeftPressed: video.seek(video.position - 5000)
	Keys.onRightPressed: video.seek(video.position + 5000)
    }
}
