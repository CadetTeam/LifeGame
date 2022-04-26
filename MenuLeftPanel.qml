//Левая панель навигации в меню
//делегатом служит LeftPanelButton
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Item {
    id: panel

    property string current_sign: "none"
    signal changeTipsY(var tipsY)
    property var tipsY:
        [upColumn.y   + plus.y     + plus.height     / 2,
         upColumn.y   + worlds.y   + worlds.height   / 2,
         upColumn.y   + examples.y + examples.height / 2,
         downColumn.y + settings.y + settings.height / 2,
         downColumn.y + exit.y     + exit.height     / 2]

    onTipsYChanged: {
        sendTipsY()
    }

    function sendTipsY() {
        changeTipsY(tipsY)
    }

    Component.onCompleted: {
        current_sign = "logo"
    }

    onCurrent_signChanged: {
        if (current_sign == "exit")
            quitApp()
        else
            changeMenuPage(current_sign)
    }

    width: background.width
    height: background.height

    //Задний фон
    Rectangle {
        id: background
        anchors.top: parent.top
        anchors.left: parent.left
        height: mainWindow.height
        radius: width / 4

        Component.onCompleted: width = height / 11

        color: "red"
        gradient: gradient
        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            height: mainWindow.height
            width: parent.radius
            gradient: gradient
        }
    }

    // градиент панели меню
    Gradient {
        id: gradient
        GradientStop {
            position: 0.0
            color: theme.top_panel
        }
        GradientStop {
            position: 1.0
            color: theme.down_panel
        }
    }

    //4 кнопки: логотип, создать, миры, примеры
    Column {
        id: upColumn
        anchors.top: parent.top
        anchors.topMargin: 10 * scale_ratio_y
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: -70 * (0.5 - plus.scale / plus.scale_animation_ratio)

        LeftPanelButton {
            id: logo
            _name: "logo"
            anchors.horizontalCenter: parent.horizontalCenter
            ratio: 0.6
        }
        //separator
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            color: theme.separator
            width: background.width * 0.7
            height: width / 25
        }

        LeftPanelButton {
            id: plus
            _name: "plus"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        //separator
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter

            color: theme.separator
            width: background.width * 0.7
            height: width / 25
        }

        LeftPanelButton {
            id: worlds
            _name: "worlds"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        //separator
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter

            color: theme.separator
            width: background.width * 0.7
            height: width / 25
        }

        LeftPanelButton {
            id: examples
            _name: "examples"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        //separator
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter

            color: theme.separator
            width: background.width * 0.7
            height: width / 25
        }
    }

    //Спициальные кнопки: настройки, выход
    Column {
        id: downColumn

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: -80 * (0.5 - settings.scale / settings.scale_animation_ratio)

        LeftPanelButton {
            id: settings
            _name: "settings"
            anchors.horizontalCenter: parent.horizontalCenter
            ratio: 0.31
        }
        LeftPanelButton {
            id: exit
            _name: "exit"
            anchors.horizontalCenter: parent.horizontalCenter
            ratio: 0.25
        }
    }
}
