import QtQuick 2.0

BaseView {
    Image {
        id: bgimage
	source: "images/Cortex-M4 Demo/Cortex-M4 Demo.png"
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter

	Text {
	    id: ping
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
	    x: 425
	    y: 207
	    width: 180
	    height: 50
	    text: "0"
	    color: "black"
	    font.family: "Arial"
            font.pixelSize: 34
	}
    }

    Timer {
        interval: 1000; running: cortexm4View.isShown; repeat: true

        onTriggered: {
	    ping.text = parseInt(ping.text) + 1
	}
    }
}
