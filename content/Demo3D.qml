import QtQuick 2.0
import QtCanvas3D 1.0
import "cube_3d.js" as GLCode
import QtGraphicalEffects 1.0

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
	objAnimationX.start();
	objAnimationY.start();
	objAnimationZ.start();
    }
    function hide() {
	visible = false;
	objAnimationX.stop();
	objAnimationY.stop();
	objAnimationZ.stop();
    }

    FastBlur {
	anchors.fill: parent
	radius: 64
	source: mainView
    }

    Rectangle {
	id: frame_3d
	width : parent.width/100*80
	height : parent.height/100*80
	anchors.horizontalCenter: parent.horizontalCenter
	anchors.verticalCenter: parent.verticalCenter
	anchors.verticalCenterOffset: 20
	
	Image {
	    id: frame
	    width : parent.width/100*110
	    height : parent.height/100*122
	    z: -1
	    anchors.horizontalCenter: parent.horizontalCenter
	    anchors.top: parent.top
	    anchors.topMargin: -112
	    source: "images/Demo3D/3d_frame.png"
	    visible: true
	}

	Image {
	    id: closeBtn
	    height: sourceSize.height * 0.8
	    width: sourceSize.width * 0.8
	    anchors.top: frame.top
	    anchors.topMargin: height - 8
	    anchors.right: frame.right
	    anchors.rightMargin: width + 18

	    source: "images/Video/close.png"
	    visible: true

	    MouseArea {
		anchors.fill: parent
		onPressed: {
		    closeBtn.source = "images/Demo3D/close_1.png"
		}
		onReleased: {
		    closeBtn.source = "images/Demo3D/close.png"
		}
		onClicked: {
		    root.hide()
		}
	    }
	}

	Canvas3D {
	    id: canvas3d

	    anchors.fill:parent

	    //! [0]
	    focus: true
	    property double xRotAnim: 0
	    property double yRotAnim: 0
	    property double zRotAnim: 0
	    property bool isRunning: false

	    //! [1]
	    // Emitted when one time initializations should happen
	    onInitializeGL: {
		GLCode.initializeGL(canvas3d);
	    }

	    // Emitted each time Canvas3D is ready for a new frame
	    onPaintGL: {
		GLCode.paintGL(canvas3d);
	    }
	    //! [1]

	    onResizeGL: {
		GLCode.resizeGL(canvas3d);
	    }

	    Keys.onSpacePressed: {
		canvas3d.isRunning = !canvas3d.isRunning
		if (canvas3d.isRunning) {
		    objAnimationX.pause();
		    objAnimationY.pause();
		    objAnimationZ.pause();
		} else {
		    objAnimationX.resume();
		    objAnimationY.resume();
		    objAnimationZ.resume();
		}
	    }

	    //! [5]
	    SequentialAnimation {
		id: objAnimationX
		loops: Animation.Infinite
		running: false
		NumberAnimation {
		    target: canvas3d
		    property: "xRotAnim"
		    from: 0.0
		    to: 120.0
		    duration: 5000
		    easing.type: Easing.InOutQuad
		}
		NumberAnimation {
		    target: canvas3d
		    property: "xRotAnim"
		    from: 120.0
		    to: 0.0
		    duration: 5000
		    easing.type: Easing.InOutQuad
		}
	    }
	    //! [5]

	    SequentialAnimation {
		id: objAnimationY
		loops: Animation.Infinite
		running: false
		NumberAnimation {
		    target: canvas3d
		    property: "yRotAnim"
		    from: 0.0
		    to: 240.0
		    duration: 3000
		    easing.type: Easing.InOutCubic
		}
		NumberAnimation {
		    target: canvas3d
		    property: "yRotAnim"
		    from: 240.0
		    to: 0.0
		    duration: 3000
		    easing.type: Easing.InOutCubic
		}
	    }

	    SequentialAnimation {
		id: objAnimationZ
		loops: Animation.Infinite
		running: false
		NumberAnimation {
		    target: canvas3d
		    property: "zRotAnim"
		    from: -100.0
		    to: 100.0
		    duration: 1000
		    easing.type: Easing.InOutSine
		}
		NumberAnimation {
		    target: canvas3d
		    property: "zRotAnim"
		    from: 100.0
		    to: -100.0
		    duration: 1000
		    easing.type: Easing.InOutSine
		}
	    }
	}
    }
}
