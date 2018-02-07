import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    id: root

    anchors.fill: parent
    color: "#ffffff"

    AnimatedImage {
        id: backgroundImage
        anchors.fill: parent
        source: "images/mainscreen/fon.png"
	onStatusChanged: { currentFrame = 0; playing: true }
	//SequentialAnimation {
        //	running: true
        //        NumberAnimation { target: backgroundImage; property: "opacity"; to: 0; duration: 400; easing.type: Easing.InQuad }
	//}
/*
        Behavior on source {
            SequentialAnimation {
                NumberAnimation { target: backgroundImage; property: "opacity"; to: 0; duration: 400; easing.type: Easing.InQuad }
                PropertyAction { target: backgroundImage; property: "source" }
                NumberAnimation { target: backgroundImage; property: "opacity"; to: 1; duration: 400; easing.type: Easing.OutQuad }
            }
        }*/
    }

    // Sky stars particles
    ParticleSystem {
        width: parent.width
        height: 220
        paused: detailsView.isShown || infoView.isShown || !settings.showShootingStarParticles
        ImageParticle {
            source: "images/star.png"
            rotationVariation: 10
        }
        Emitter {
            anchors.fill: parent
            emitRate: 4
            lifeSpan: 5000
            size: 48
            sizeVariation: 16
        }
    }
}
