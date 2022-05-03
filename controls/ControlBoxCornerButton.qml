import QtQuick
import QtQuick.Controls 2.5

// кнопочка сброса(front+)

Item {
    id: button
    property string buttonImageURL: ""
    property bool mirrored: false

    onMirroredChanged: {
        LayoutMirroring.enabled = mirrored
        LayoutMirroring.childrenInherit = mirrored
    }

    anchors.bottom: parent.bottom
    anchors.left: parent.left

    width: parent.width/12
    height: parent.height/6


    MouseArea{
        anchors.fill: parent
        onClicked: {
            button.mirrored? button.parent.rightClicked() : button.parent.leftClicked()
        }
    }

    Rectangle {
        id: centerWhite
        color: theme.background

        radius: parent.width/3.5

        anchors.fill: parent
    }

    Rectangle {
        id: topWhite
        color: theme.background

        width: centerWhite.width/2
        height: centerWhite.height*2

        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    Rectangle {
        id: rightWhite
        color: theme.background

        width: centerWhite.width*2
        height: centerWhite.height/2

        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    Rectangle {
        id: topGrey
        color: theme.gameControl

        radius: centerWhite.radius*1.5
        width: centerWhite.width

        height: centerWhite.height*2

        anchors.left: parent.left

        anchors.bottom: centerWhite.top
    }

    Rectangle {
        id: rightGrey
        color: theme.gameControl

        radius: centerWhite.radius*1.5

        width: centerWhite.width*2
        height: centerWhite.height

        anchors.left: centerWhite.right

        anchors.bottom: parent.bottom
    }

    Image{
        id: image
        anchors.fill: parent
        source: buttonImageURL
    }
}
