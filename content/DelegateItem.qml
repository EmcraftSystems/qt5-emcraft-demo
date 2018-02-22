import QtQuick 2.0

Item {
    id: root1

    property string name
    property bool isSelected: listView.currentIndex === index
    property bool gif_off: true

    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: isSelected ? 30 : -0
//    anchors.horizontalCenter: parent.horizontalCenter
    width: mainView.width / 4 // /*parent ? parent.width :*/ imageItem.width * 0.8 / 3
    height: mainView.height / 2 //(parent ? parent.height : imageItem.height
    z: isSelected ? 1000 : -index
//    rotation: isSelected ? 0 : -15
    scale: isSelected ? 1.6 : 1.2
    opacity: isSelected || ((listView.currentIndex + 7) % 8) == index ||
	((listView.currentIndex + 1) % 8) == index

    function switch_gif() {
	if (isSelected) {
	    gif_off = false
	    aniItem.source = "images/" + model.gif
	} else {
	    gif_off = true
	    aniItem.source = ""
	}
    }

    Behavior on rotation {
        NumberAnimation { duration: 500; easing.type: Easing.OutBack }
    }
    Behavior on scale {
	SequentialAnimation  {
	    NumberAnimation { duration: 2500; easing.type: Easing.OutElastic }
	    ScriptAction { script: switch_gif() }
	}
    }
    Behavior on opacity {
        NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
	    autoDemoStop()
            if (isSelected) {
		console.log("Activate ", model.name)
		if (model.name == "VIDEO") {
		    video.state = "windowed"
		    video.show()
		} else if (model.name == "VIDEO_FS") {
		    video.state = "fullscreen"
		    video.show()
		} else if (model.name == "3D DEMO") {
		    demo_3d.show()
		} else if (model.name == "METRICS") {
		    metricsView.show()
		} else if (model.name == "SYSTEM") {
		    systemView.show()
		} else if (model.name == "CORTEX-M4") {
		    cortexm4View.show()
		} else if (model.name == "ALEXA") {
		    alexaView.show()
		} else {
                    errView.text = "Unable to play live camera feed due to the following error: Camera not connected or unrecognized by the system"
		    errView.show()
		}
            } else {
                listView.currentIndex = index;
            }
        }
    }

    Image {
        id: imageCloud
        source: "images/mainscreen/svet2.png"
        visible: root1.isSelected
    	anchors.verticalCenter: parent.verticalCenter
	height: parent.height //* 0.8
	width: parent.width //* 0.9
    }

    Image {
        id: imageItem
        source: "images/" + (isSelected ? model.image : model.image_bg)
    	anchors.verticalCenter: parent.verticalCenter
        //anchors.top: parent.top
	height: parent.height * 0.8
	width: parent.width * 0.9
    }

    AnimatedImage {
	id: aniItem
	source: ""
	visible: root1.isSelected && !listView.moving && !listView.flicking
	paused: !root1.isSelected | !mainView.act | gif_off
	cache: false
	anchors.verticalCenter: parent.verticalCenter
	//anchors.top: parent.top
	height: parent.height * 0.8
	width: parent.width * 0.9
    }
}
