import QtQuick 2.0

BaseView {
    Image {
        id: bgimage
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

    Timer {
        interval: 1000; running: metricsView.isShown; repeat: true
	property var cpu_load: [ 0, 0, 0, 0 ]
	
	function calc_load(cur, prev) {
	    if (cur - prev > 100)
		return "0%"
	    return 100 - (cur - prev) + "%"
	}

        onTriggered: {
	    fps.text = fpsItem.fps

	    var request = new XMLHttpRequest()
	    request.open("GET", "file:///sys/class/thermal/thermal_zone0/temp", false)
	    request.send(null)
	    temp.text = request.responseText / 1000

	    request.open("GET", "file:///proc/stat", false)
	    request.send(null)

	    var lines = request.responseText.split('\n')

	    if (cpu_load[0]) {
		cpu0.text = calc_load(lines[1].split(' ')[4], cpu_load[0])
		cpu1.text = calc_load(lines[2].split(' ')[4], cpu_load[1])
		cpu2.text = calc_load(lines[3].split(' ')[4], cpu_load[2])
		cpu3.text = calc_load(lines[4].split(' ')[4], cpu_load[3])
	    }

	    cpu_load[0] = parseInt(lines[1].split(' ')[4])
	    cpu_load[1] = parseInt(lines[2].split(' ')[4])
	    cpu_load[2] = parseInt(lines[3].split(' ')[4])
	    cpu_load[3] = parseInt(lines[4].split(' ')[4])
	}
    }
}
