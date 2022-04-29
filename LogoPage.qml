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
        x: (page.width - width) * 0.8
        anchors.verticalCenter: parent.verticalCenter
    }
}
