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
        anchors.bottomMargin: height * scale
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        text: "Создайте новый мир!"
        font.pointSize: 60
        scale: page.width / 1400
    }

    Row{
        id: row
        anchors.centerIn: parent
        width: 500
        spacing: 30
        scale: page.width / 1400
        Controls.InputLine{
            id: input
            width: row.width - button.width - row.spacing
            height: 34
            lineName: "Имя"
        }
        Controls.PushButton{
            id: button
            height: 34
            width: 140
            buttonText: "Создать"
        }
    }


}
