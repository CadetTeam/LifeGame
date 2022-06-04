import QtQuick 2.15
import "qrc:/controls/" as Controls

Item {
    id: page
    Rectangle{
        anchors.fill: parent
        color: theme.background
    }

    Column{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: dy
        anchors.horizontalCenterOffset: dx
        spacing: header.height * scale * 0.5
        scale: Math.sqrt(page.width * page.height) / 1000
        Text {
            id: header
            font.family: comfortaa_light.name
            anchors.horizontalCenter: parent.horizontalCenter
            fontSizeMode: Text.Fit
            text: "Создайте новый мир!"
            font.pointSize: 60
        }

        Row{
            id: row
            anchors.horizontalCenter: parent.horizontalCenter
            width: 500
            spacing: 30
            Controls.InputLine{
                id: input
                width: row.width - button.width - row.spacing
                height: 30
                lineName: "Имя"
                function changeButtonStatus(status){
                    button.active = status
                }
            }
            Controls.PushButton{
                id: button
                height: 30
                width: 140
                buttonText: "Создать"
            }
        }
    }


}
