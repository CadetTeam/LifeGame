import QtQuick 2.0
import "qrc:/figures/" as Figures

Item {
    id: anim

    visible: state != "null"

    property string state: "null"

    onStateChanged: {
        switch (state) {
        case "logo":
            go(figure_1.width/2, mainPage.height - figure_1.height/2, -40, mainPage.width - figure_2.width * 1.5, 40, -45, 400)
            break
        case "plus":
            // todo
             go(mainPage.width - figure_1.width/2, mainPage.height - figure_1.height/2, 140, -10, -10, 80, 400)
            break
        default:
            state = "null"
            break
        }
    }

    property var aim

    function go(x1, y1, r1, x2, y2, r2, dur){
        aim = [x1, y1, r1, x2, y2, r2, dur]

        animation.running = true
    }
    ParallelAnimation {
        id: animation
        NumberAnimation {target: figure_1; property: "x"; to: aim[0]; duration: aim[6]}
        NumberAnimation {target: figure_1; property: "y"; to: aim[1]; duration: aim[6]}
        NumberAnimation {target: figure_1; property: "rotation"; to: aim[2]; duration: aim[6]}

        NumberAnimation {target: figure_2; property: "x"; to: aim[3]; duration: aim[6]}
        NumberAnimation {target: figure_2; property: "y"; to: aim[4]; duration: aim[6]}
        NumberAnimation {target: figure_2; property: "rotation"; to: aim[5]; duration: aim[6]}
    }

    MouseArea{
        id: area
        anchors.fill: parent
        hoverEnabled: true
        property int motion_ratio: 350
        onMouseXChanged: {
            if(animation.running == false)
            {
                var dx = mouseX - area.width/2

                figure_1.x = aim[0] + dx / (motion_ratio)
                figure_2.x = aim[3] + dx / (motion_ratio)
            }
        }
        onMouseYChanged: {
            if(animation.running == false)
            {
                var dx = mouseY - area.height/2

                figure_1.y = aim[1] + dx / (motion_ratio)
                figure_2.y = aim[4] + dx / (motion_ratio)
            }
        }
    }

    Figures.Template {
        id: figure_1
        size_: mainPage.width/3.2
        template_: [0,1,0,0,0,1,1,1,1]
    }
    Figures.Template {
        id: figure_2
        size_: mainPage.width/3.3
        template_: [0,1,1,0,1,0,0,1,0,1,0,1,0,0,1,0]
    }
}
