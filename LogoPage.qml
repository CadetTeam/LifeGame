///Главная страница

import QtQuick 2.0
import "qrc:/controls/" as Controls

Item {
    id: page
    anchors.fill: parent

    property var tipsY: [0, 0, 0, 0, 0]
    property var tipText:
        [qsTr("Создать новый мир"),
        qsTr("Ваши миры"),
        qsTr("Примеры"),
        qsTr("Настройки"),
        qsTr("Выйти")]

    Connections {
        target: panel
        function onChangeTipsY(tipsY_) {
            tipsY = tipsY_
        }
    }

    Connections {
        target: mainWindow
        function onUpdateWelcomeTextY(){
            mainWindow.welcomeTextY = welcomeText.y
        }

        function onUpdateWelcomeTextDownY(){
            mainWindow.welcomeTextDownY = welcomeText.y + welcomeText.height
        }
    }


    Item {
        id: tips
        Repeater {
            model: tipsY
            delegate: Controls.TipText {
                y: tipsY[index] - height / 2
                x: 10
                text: "— " + tipText[index]
            }
        }
    }

    Controls.WelcomeText {
        id: welcomeText
        x: (page.width - width) * 0.8
        y: (page.height - height) * 0.7

        scale: Math.sqrt(scale_ratio_x * scale_ratio_y)
    }
}
