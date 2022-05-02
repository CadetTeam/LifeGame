import QtQuick 2.0

// прямоугольник с настроечкой
Item {
    width: parent.width/6
    height: parent.height/6.5

    Rectangle {
        id: basePanel
        radius: parent.width/10
        color: theme.gameControl

        anchors.fill: parent

        Text {
            id: text

            anchors.horizontalCenter: parent.horizontalCenter

            anchors.top: parent.top
            anchors.topMargin: parent.height/5

            font.family: comfortaa_light.name

            text: qsTr("Размеры поля")

            Component.onCompleted: {
                font.pointSize = basePanel.height/7
            }
        }



        ResetButton {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }

    }
}
