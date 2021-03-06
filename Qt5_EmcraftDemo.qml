import QtQuick 2.0
import QtGraphicalEffects 1.0
import "content"
import Launcher 1.0
//import QtMultimedia 5.8

Item {
    id: mainWindow

    property int curIdx: 0
    
    width: 1920
    height: 1080

    QtObject {
        id: settings
        // These are used to scale fonts according to screen size
        property real _scaler: 300 + mainWindow.width * mainWindow.height * 0.00015
        property int fontXS: _scaler * 0.032
        property int fontS: _scaler * 0.040
        property int fontM: _scaler * 0.046
        property int fontMM: _scaler * 0.064
        property int fontL: _scaler * 0.100
        // Settings
        property bool showFogParticles: true
        property bool showShootingStarParticles: true
        property bool showLighting: true
        property bool showColors: true
        property real modal_opacity: 0.75
        property bool auto_demo: true
        property bool tv_mode: false
    }

    MainView {
        id: mainView
    }

    MainListModel {
        id: mainListModel
    }

    ErrorView {
        id: errView
    }

    VideoPlay {
	id: video
    }

    Demo3D {
	id: demo_3d
    }

    AlexaView {
	id: alexaView
    }

    AboutView {
	id: aboutView
    }

    SettingsView {
	id: settingsView
    }

    MetricsView {
	id: metricsView
    }

    SystemView {
	id: systemView
    }

    Cortexm4View {
	id: cortexm4View
    }

    FpsItem {
	id: fpsItem
	anchors.bottom: parent.bottom
	anchors.bottomMargin: 50
	anchors.right: parent.right
	anchors.rightMargin: 64
	visible: false
    }
}
