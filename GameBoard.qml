import QtQuick 2.0
import "qrc:/controls" as Controls

// Страница, самой игры (процесса)
Item {
    id: gamePage
    //anchors.fill: parent
    Controls.GameControlBox{ // одна из коробок
        id: gameScale

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/40

        anchors.left: parent.left
        anchors.leftMargin: parent.width/30
    }

}
