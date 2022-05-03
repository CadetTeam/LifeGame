import QtQuick 2.0

// прямоугольник с настроечкой
Item {
    id: box

    property string leftButton: ""
    property string rightButton: ""

    function rightClicked() {

    }
    function leftClicked() {

    }

    onLeftButtonChanged: {
        var component = Qt.createComponent("ControlBoxCornerButton.qml");
        var sprite = component.createObject(box);
        sprite.buttonImageURL = leftButton
    }

    onRightButtonChanged: {
        var component = Qt.createComponent("ControlBoxCornerButton.qml");
        var sprite = component.createObject(box);
        sprite.buttonImageURL = rightButton
        sprite.mirrored = true
    }

    width: parent.width/6
    height: parent.height/6.5

    Rectangle {
        id: background
        radius: parent.width/10
        color: theme.gameControl

        anchors.fill: parent
    }
}
