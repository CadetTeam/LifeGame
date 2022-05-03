import QtQuick 2.0
import "qrc:/controls/" as Controls

Item {
    id: page
    Rectangle{
        anchors.fill: parent
        color: theme.background
    }
    Text {
        id: header
        font.family: comfortaa_light.name
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: row.top
        anchors.bottomMargin: height
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        text: "Создайте новый мир!"
        font.pointSize: 60
        scale: page.width / 1400
    }
    property int contentHeight: page.height / 22
    Row{
        id: row
        anchors.centerIn: parent
        width: header.width * 0.8
        spacing: button.width * 0.2
        Controls.InputLine{
            id: input
            width: row.width - button.width - row.spacing
            height: contentHeight
            lineName: "Имя"
        }
        Controls.PushButton{
            id: button
            height: contentHeight
            width: height * 4
            buttonText: "Создать"
        }
    }


}
