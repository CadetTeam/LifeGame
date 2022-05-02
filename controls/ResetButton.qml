import QtQuick 2.0
import QtQuick.Controls 2.5

// кнопочка сброса(front+)

Item {
    width: parent.width/12
    height: parent.height/6
    Rectangle {
        id: centerWhite
        color: theme.resetButtonWhite

        radius: parent.width/3.5

        anchors.fill: parent

        MouseArea {
        //
        }
        TapHandler {

        }
    }

    Rectangle {
        id: topWhite
        color: theme.resetButtonWhite

        width: centerWhite.width/2
        height: centerWhite.height*2


        anchors.bottom: parent.bottom

        anchors.left: parent.left
    }

    Rectangle {
        id: rightWhite
        color: theme.resetButtonWhite

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


}
