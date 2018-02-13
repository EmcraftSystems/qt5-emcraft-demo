import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root1

    property string name
    property bool isSelected: listView.currentIndex === index

    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: isSelected ? 30 : -0
//    anchors.horizontalCenter: parent.horizontalCenter
    width: mainView.width / 4 // /*parent ? parent.width :*/ imageItem.width * 0.8 / 3
    height: mainView.height / 2 //(parent ? parent.height : imageItem.height
    z: isSelected ? 1000 : -index
//    rotation: isSelected ? 0 : -15
    scale: isSelected ? 1.6 : 1
    opacity: Math.abs(listView.currentIndex - index) > 1 ? 0 : 1

    Behavior on rotation {
        NumberAnimation { duration: 500; easing.type: Easing.OutBack }
    }
    Behavior on scale {
        NumberAnimation { duration: 2500; easing.type: Easing.OutElastic }
    }
    Behavior on opacity {
        NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
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
		} else {
                    errView.text = "Unable to play live camera feed due to the following error: Camera not connected or unrecognized by the system"
		    errView.show()
		}
            } else {
                listView.currentIndex = index;
                if (settings.showShootingStarParticles) shootingStarBurst.burst(50);
            }
        }
    }

    Image {
        id: imageCloud
        source: "images/mainscreen/svet2.png"
        visible: true
    }

    Image {
        id: imageItem
        source: "images/" + (isSelected ? model.image : model.image_bg)
        visible: true
    }

    ShaderEffectSource {
        id: s0
        sourceItem: imageCloud
        hideSource: settings.showLighting
        visible: root1.isSelected
    	anchors.verticalCenter: parent.verticalCenter
        //anchors.top: parent.top
	height: parent.height //* 0.8
	width: parent.width //* 0.9
    }

    ShaderEffectSource {
        id: s1
        sourceItem: imageItem
        hideSource: settings.showLighting
        visible: settings.showLighting
    	anchors.verticalCenter: parent.verticalCenter
        //anchors.top: parent.top
	height: parent.height * 0.8
	width: parent.width * 0.9
/*
	Text {
            id: titleText
	    visible: false //root1.isSelected
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: +150
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: model.name
            color: "#ffffff"
            style: Text.Raised
            styleColor: "black"
            //font.pixelSize: settings.fontL
	    font.family: "Calibri" //"Arial"
            font.pixelSize: 60
	}*/
    }
/*
    ShaderEffectSource {
        id: s2
        sourceItem: aniItem
        hideSource: settings.showLighting
        visible: false //root1.isSelected
    	anchors.verticalCenter: parent.verticalCenter
        //anchors.top: parent.top
	height: parent.height * 0.8
	width: parent.width * 0.9
    }
*/
/*
    FastBlur {
        anchors.fill: s1
	source: s1
	radius: 64
//        radius: root.blurAmount
//        visible: root.blurAmount
    }
*/

    AnimatedImage {
        id: aniItem
        source: "images/" + model.gif
        visible: root1.isSelected
	cache: false
    	anchors.verticalCenter: parent.verticalCenter
        //anchors.top: parent.top
	height: parent.height * 0.8
	width: parent.width * 0.9
    }

    ShaderEffect {
        anchors.fill: imageItem
        property variant src: s1
//        property variant srcNmap: s2//coverNmapSource
        property variant srcBG: s0//coverNmapSource
        property real widthPortition: mainView.width/imageItem.width
        property real heightPortition: mainView.height/imageItem.height
        property real widthNorm: widthPortition * 0.5 - 0.5
        property real heightNorm: root1.y/imageItem.height - listView.contentY / imageItem.height
//        property real lightPosX: listView.globalLightPosX * widthPortition - widthNorm
//        property real lightPosY: listView.globalLightPosY * heightPortition - heightNorm
        visible: settings.showLighting

        fragmentShader: "
            uniform sampler2D src;
            uniform sampler2D srcNmap;
            uniform lowp float qt_Opacity;
            varying highp vec2 qt_TexCoord0;
            //uniform highp float lightPosX;
            //uniform highp float lightPosY;
	    void main() {
                highp vec4 pix = texture2D(src, qt_TexCoord0.st);
                highp vec4 pix2 = texture2D(srcNmap, qt_TexCoord0.st);
//                highp vec4 pix = texture2D(src, qt_SubRect_src.st);
//                highp vec4 pix2 = texture2D(srcNmap, qt_SubRect_srcNmap.st);
                //highp vec3 normal = normalize(pix2.rgb * 2.0 - 1.0);
                //highp vec3 light_pos = normalize(vec3(qt_TexCoord0.x - lightPosX, qt_TexCoord0.y - lightPosY, 0.8 ));
                //highp float diffuse = max(dot(normal, light_pos), 0.2);

                // boost a bit
                //diffuse *= 2.5;

                highp vec3 color = pix.rgb;//diffuse * pix.rgb;
                //gl_FragColor = vec4(color, pix.a) * qt_Opacity + vec4(pix2.rgb, pix2.a) * qt_Opacity;
            }
        "

    }
}
