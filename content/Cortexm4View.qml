import QtQuick 2.0
import SerialIO 1.0

BaseView {
    property string dev: "/dev/ttyRPMSG30"
    Image {
        id: bgimage
	source: "images/CortexM4/CortexM4-frame.png"
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

    show_callback: "timer.start()"
    hide_callback: "timer.stop()"

    SerialIO {
	id: sline
	pname: dev
    }

    Timer {
	id: timer
	interval: 1000; running: false; repeat: true
	property string str: "ping M4 " + cnt + "\n\r"
	property int cnt: 0
	property string line

        onTriggered: {
	    console.log(sline.write(str))
	    line = sline.readAll()
	    console.log(str)
	    console.log(line)
	    console.log(str.length, line.length)
	    console.log(str.localeCompare(line))
	    console.log(line.charCodeAt(9), line.charCodeAt(10), line.charCodeAt(11))
	    if (!str.localeCompare(line)) {
		ping.text = parseInt(ping.text) + 1
		cnt++
	    }
	}
    }
}
