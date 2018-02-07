import QtQuick 2.0
import QtQuick.Particles 2.0
import QtGraphicalEffects 1.0

Item {
    id: root

    // Set this to blur the mainView when showing something on top of it
    property real blurAmount: 0

    // Updates the blur shader source, best called right before adding blurAmount
    function scheduleUpdate() {
        mainContentSource.scheduleUpdate();
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

        ListView {
            id: listView

	    width: parent.width * 0.8
	    height: parent.height * 0.6

	    orientation: Qt.Horizontal
	    anchors.verticalCenter: parent.verticalCenter
    	    anchors.horizontalCenter: parent.horizontalCenter

            property real globalLightPosX: lightImage.x / root.width
            property real globalLightPosY: lightImage.y / root.height

            // Normal-mapped cover shared among delegates
            ShaderEffectSource {
                id: coverNmapSource
                sourceItem: Image { source: "images/oval.png" }
                hideSource: true
                visible: false
        	anchors.bottom: parent.bottom
		height: 256
		width: 256
            }

            //anchors.fill: parent
            spacing: -60
            model: moviesModel
            delegate: DelegateItem {
                name: model.name
            }
            highlightFollowsCurrentItem: true
            highlightRangeMode: ListView.StrictlyEnforceRange
            highlightMoveDuration: 400
            preferredHighlightBegin: root.width * 0.5 - 380
            preferredHighlightEnd: root.width * 0.5
            cacheBuffer: 4000
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
    		     errView.text = "Sorry, this demo is not yet implemented. Please check back later!"
		     errView.show()
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
    		     errView.text = "Sorry, this demo is not yet implemented. Please check back later!"
		     errView.show()
		 }
	     }
	}

	AnimatedImage {
	     id: nxplogo
	     source: "images/mainscreen/NXP_logo.gif"
	     anchors.top: parent.top
	     anchors.topMargin: 25
	     anchors.right: parent.right
	     anchors.rightMargin: 15
	}

	Text {
            id: poweredByText
	    visible: true
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
	    font.family: "Helios"
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
}
