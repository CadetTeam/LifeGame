import QtQuick 2.15
import QtQuick.Controls 2.5

import "qrc:/controls" as Controls
import "qrc:/figures" as Figures

MouseArea{
    id: area
    hoverEnabled: true
    property int motion_ratio: 100
    onMouseXChanged: {
        if(!f_animator.running())
        {
            var dx = mouseX - area.width/2

            f_animator.figure_1.x = f_animator.aim[0] + dx / (motion_ratio)
            f_animator.figure_2.x = f_animator.aim[3] + dx / (motion_ratio * 2)
        }
        mainWindow.dx = (mouseX - area.width/2) / -(motion_ratio)
    }
    onMouseYChanged: {
        if(!f_animator.running())
        {
            var dy = mouseY - area.height/2

            f_animator.figure_1.y = f_animator.aim[1] + dy / (motion_ratio)
            f_animator.figure_2.y = f_animator.aim[4] + dy / (motion_ratio * 2)
        }
        mainWindow.dy = (mouseY - area.height/2) / -(motion_ratio)
    }
}
