import QtQuick 2.15

Rectangle{
    id: button

    property string buttonText: ""
    property bool active: false

    function _clicked(){}

    radius: height
    color: active? theme.pushbutton_active : theme.pushbutton_inactive

    Text{
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: theme.text_button
        text: buttonText
        font.family: comfortaa_semibold.name
        font.pointSize: 16
    }

    MouseArea{
        anchors.fill: parent
        onClicked: _clicked()
    }

    NumberAnimation {
        id: scale_anim
        target: button
        property: "scale"
        duration: 100
        to: !hover.hovered? 1.03 : 1
    }
    HoverHandler{
        id: hover
        onHoveredChanged: scale_anim.restart()
    }
}
