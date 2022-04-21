//Левая панель навигации в меню
//делегатом служит LeftPanelButton
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Item {
    id: panel

    property string current_sign: "logo"

    onCurrent_signChanged: {
        if (current_sign == "exit")
            quitApp()
        else
            changeMenuPage(current_sign)
    }

    width: background.width
    height: background.height

    //Задний фон
    Image {
        id: background
        height: mainWindow.height
        width: height / 14.62
        source: "qrc:/images/leftPanel_bg"
    }

    // Логотип/домашняя страница
    LeftPanelButton {
        id: logo
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -70 * (0.5 - scale) + 10
        ratio: 0.6
        _name: "logo"
    }

    //3 кнопки: создать, миры, примеры
    Column {

        anchors.top: parent.top
        anchors.topMargin: 150 * scale_ratio_y
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: -70 * (0.5 - plus.scale / plus.scale_animation_ratio)
        //separator
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            color: theme.separator
            width: background.width * 0.7
            height: width / 25
        }

        LeftPanelButton {
            id: plus
            anchors.horizontalCenter: parent.horizontalCenter
            _name: "plus"
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
            anchors.horizontalCenter: parent.horizontalCenter
            _name: "worlds"
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
            anchors.horizontalCenter: parent.horizontalCenter
            _name: "examples"
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

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        spacing: -70 * (0.5 - settings.scale / settings.scale_animation_ratio)

        LeftPanelButton {
            id: settings
            anchors.horizontalCenter: parent.horizontalCenter
            ratio: 0.31
            _name: "settings"
        }
        LeftPanelButton {
            id: exit
            anchors.horizontalCenter: parent.horizontalCenter
            ratio: 0.25
            _name: "exit"
        }
    }
}
