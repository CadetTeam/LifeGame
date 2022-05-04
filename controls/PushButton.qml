import QtQuick

Rectangle{

    property string buttonText: ""
    property bool active: false

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
}
