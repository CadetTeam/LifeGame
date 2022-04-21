import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Image {
    id: button
    property string _name: "none"
    property real ratio: 0.5
    property real scale_animation_ratio: 1

    scale: background.width * ratio * scale_animation_ratio / width

    source: "qrc:/images/" + _name
    opacity: hover.containsMouse || current_sign == _name ? 0.8 : 1.0

    MouseArea {
        id: hover
        anchors.fill: parent
        hoverEnabled: true
        onContainsMouseChanged: {
            containsMouse ? scaleUp.start() : scaleDown.start()
        }
        onClicked: panel.current_sign = _name
    }

    NumberAnimation on scale_animation_ratio {
        id: scaleUp
        to: 1.1
        duration: 100
        onFinished: {
            if (!hover.containsMouse)
                scaleDown.start()
        }
    }
    NumberAnimation on scale_animation_ratio {
        id: scaleDown
        to: 1
        duration: 100
    }
}
