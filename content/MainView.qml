import QtQuick 2.0
import QtQuick.Particles 2.0
import QtGraphicalEffects 1.0

Item {
    id: root

    // Set this to blur the mainView when showing something on top of it
    property real blurAmount: 0

    property bool act: true

    // Updates the blur shader source, best called right before adding blurAmount
    function scheduleUpdate() {
        mainContentSource.scheduleUpdate();
    }

    function updateVideoSource() {
	if (mainListModel.get(listView.currentIndex).name.indexOf("VIDEO") == 0) {
	    video.vid_src = "demo.mp4"
	} else {
	    video.vid_src = ""
	}
    }

    anchors.fill: parent

    // Update blur shader source when width/height changes
    onHeightChanged: {
        root.scheduleUpdate();
    }
    onWidthChanged: {
        root.scheduleUpdate();
    }

    Item {
        id: mainViewArea
        anchors.fill: parent

        Background {
            id: background
        }

        PathView {
            id: listView

	    anchors.verticalCenter: parent.verticalCenter
    	    anchors.horizontalCenter: parent.horizontalCenter
	    anchors.fill: parent
	    property int list_offset: mainViewArea.width/15

            model: mainListModel
            delegate: DelegateItem {
                name: model.name
            }
            highlightMoveDuration: 400
	    flickDeceleration: 80

	    pathItemCount: 8
	    preferredHighlightBegin: 0.5
	    preferredHighlightEnd: 0.5
	    highlightRangeMode: PathView.StrictlyEnforceRange

	    path: Path {
		startX: -mainViewArea.width/3 + listView.list_offset
		startY: mainViewArea.height/2
		PathLine { x: mainViewArea.width/2 + listView.list_offset; y: mainViewArea.height/2}
		PathLine { x: mainViewArea.width/3 * 4; y: mainViewArea.height/2}
	    }

	    onCurrentIndexChanged: {
		if (!moving && !flicking) {
		    updateVideoSource()
		}
	    }
	    onMovementEnded: updateVideoSource()
	    onFlickEnded: updateVideoSource()
        }

	Image {
	     id: infoBtn
	     source: "images/mainscreen/info_1.png"
	     anchors.verticalCenter: parent.verticalCenter
	     anchors.verticalCenterOffset: 30
	     anchors.left: parent.left
	     anchors.leftMargin: 15

	     MouseArea {
	         anchors.fill: parent
		 onPressed: {
		     infoBtn.source = "images/mainscreen/info_2.png"
		 }
		 onReleased: {
		     infoBtn.source = "images/mainscreen/info_1.png"
		 }
		 onClicked: {
    		     //aboutView.text = ""
		     aboutView.show()
		 }
	     }
	}

	Image {
	     id: settingsBtn
	     source: "images/mainscreen/settings_1.png"
	     anchors.top: infoBtn.bottom
	     anchors.topMargin: 15
	     anchors.left: parent.left
	     anchors.leftMargin: 15

	     MouseArea {
	         anchors.fill: parent
		 onPressed: {
		     settingsBtn.source = "images/mainscreen/settings_2.png"
		 }
		 onReleased: {
		     settingsBtn.source = "images/mainscreen/settings_1.png"
		 }
		 onClicked: {
    		     //settingsView.text = ""
		     settingsView.show()
		 }
	     }
	}

	AnimatedImage {
	     id: nxplogo
	     source: "images/mainscreen/NXP_logo.gif"
	     anchors.top: parent.top
	     //anchors.topMargin: 25
	     anchors.right: parent.right
	     //anchors.rightMargin: 15
	     paused: !root.act
	}

	Text {
            id: poweredByText
	    visible: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            anchors.left: parent.left
            anchors.leftMargin: 190
//            width: parent.width * 0.8
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: "Powered by Linux"
            color: "#ffffff"
            //style: Text.Outline
            //styleColor: "#b0a030"
	    font.family: "Arial"
            font.pixelSize: 34
	}
    }

    FastBlur {
        anchors.fill: mainViewArea
        radius: root.blurAmount
        visible: root.blurAmount
        source: ShaderEffectSource {
            id: mainContentSource
            anchors.fill: parent
            sourceItem: mainViewArea
            hideSource: false
            live: false
            visible: root.blurAmount
        }
    }

    Timer {
	id: autodemo

        interval: 1000; running: settings.auto_demo; repeat: true

	property int curtime: 0
	property int nexttime: 0
	property int curaction: 0
	/* scenario descriptior: action to perfrom and delay after action */
	property var actions: [
	    [ 2, "" ],
	    [ 8, "systemView.show()" ],
	    [ 2, "systemView.hide()" ],
	    [ 4, "listView.incrementCurrentIndex()" ],
	    [ 8, "video.state = \"windowed\"; video.show()" ],
	    [ 2, "video.hide()" ],
	    [ 4, "listView.incrementCurrentIndex()" ],
	    //[ 8, "alexView.show()" ],
	    //[ 2, "alexaView.hide()" ],
	    [ 4, "listView.incrementCurrentIndex()" ],
	    [ 8, "demo_3d.show()" ],
	    [ 2, "demo_3d.hide()" ],
	    [ 4, "listView.incrementCurrentIndex()" ],
	    [ 8, "metricsView.show()" ],
	    [ 2, "metricsView.hide()" ],
	    [ 4, "listView.incrementCurrentIndex()" ],
	    //[ 8, "cortexm4View.show()" ],
	    //[ 2, "cortexm4View.hide()" ],
	    [ 4, "listView.incrementCurrentIndex()" ],
	    [ 8, "video.state = \"fullscreen\"; video.show()" ],
	    [ 2, "video.hide()" ],
	    [ 4, "listView.incrementCurrentIndex()" ],
	    //cameraView
	    [ 4, "listView.incrementCurrentIndex()" ],
	    [ 8, "aboutView.show()" ],
	    [ 2, "aboutView.hide()" ],
	    [ 3, ""],
	]

        onTriggered: {
	    if (nexttime == curtime) {
		if (actions[curaction][1] != "")
		    eval(actions[curaction][1])
		nexttime = curtime + actions[curaction][0]
		curaction++
		if (curaction == actions.length) {
		    curaction = 0
		    curtime = -1
		    nexttime = 0
		    //settings.auto_demo = false
		}
	    }
	    curtime++
	}
    }
}
