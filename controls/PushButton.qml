import QtQuick

Rectangle{

    property string buttonText: ""
    property bool active: false

    radius: height
    color: active? theme.pushbutton_active : theme.pushbutton_inactive

    Text{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: height * 0.1
        color: theme.text_button
        text: buttonText
        font.family: comfortaa_semibold.name
        font.pointSize: page.contentHeight / 2
    }
}
