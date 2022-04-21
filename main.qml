///
// main.qml
// LifeGame — 2022, Nestik55, toniess
//  Правила игры Жизнь
//  1. Если рядом с мертвой клеткой 3 живых, то зарождается жизнь
//  2. Если рядом с живой клеткой не 2 и не 3 живых, то она умирает
//  3. Обновление поля синхронно
///
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

ApplicationWindow {
    id: mainWindow
    visible: true

    readonly property real window_scale: 0.75

    readonly property real scale_ratio_x: /*Screen.width / */ width / 1650
    readonly property real scale_ratio_y: /* Screen.height / */ height / 1050

    width: Screen.width * window_scale
    height: Screen.height * window_scale

    minimumWidth: Screen.width * 0.5
    minimumHeight: Screen.height * 0.5

    //    пропорциональное изменение размеров окна (требует доработки)
    //    onWidthChanged: height = width * Screen.height / Screen.width
    //    onHeightChanged: width = height * Screen.width / Screen.height
    Component.onCompleted: {
        x = (Screen.width - width) / 2
        y = (Screen.height - height) / 2
    }

    readonly property var theme: {
        "button": "#EFEFFC",
        "logo_line": "#B0B3F3",
        "separator": "#696BE6"
    }

    function quitApp() {}
    function changeMenuPage(page_id) {}

    FontLoader {
        id: comfortaa
        source: "qrc:/fonts/Comfortaa/Comfortaa-VariableFont_wght.ttf"
    }

    FontLoader {
        id: poppins
        source: "qrc:/fonts/Poppins/Poppins-SemiBold.ttf"
    }

    MenuLeftPanel {
        id: panel
    }
}
