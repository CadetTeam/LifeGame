import QtQuick 2.0
//import QtGraphicalEffects 1.15
import "qrc:/figures/" as Figures

Item {
    id: anim

    visible: state != "null"

    property string state: "null"
    signal updateWelcomeTextY()

    function resizeContent(){
        var state_last = state
        state = "null"
        state = state_last
    }

    onStateChanged: {
        switch (state) {
        case "logo":
            go((mainPage.width-figure_1.width)/5, getWelcomeTextDownY(), figure_1.size_ * -0.2, mainPage.width - figure_2.width * 1.5, getWelcomeTextY() - figure_2.height, -120 + figure_2.size_ * 0.2, 400)
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

        animation.restart()
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
        property int motion_ratio: 100
        onMouseXChanged: {
            if(animation.running == false)
            {
                var dx = mouseX - area.width/2

                figure_1.x = aim[0] + dx / (motion_ratio)
                figure_2.x = aim[3] + dx / (motion_ratio * 2)
            }
        }
        onMouseYChanged: {
            if(animation.running == false)
            {
                var dx = mouseY - area.height/2

                figure_1.y = aim[1] + dx / (motion_ratio)
                figure_2.y = aim[4] + dx / (motion_ratio * 2)
            }
        }
    }

    Figures.Template {
        id: figure_1
        size_: figure_2.size_ * 0.75
        template_: [0,1,0,0,0,1,1,1,1]
    }
    Figures.Template {
        id: figure_2
        size_: Math.sqrt(mainPage.width * mainPage.height)/2.5
        template_: [0,1,1,0,1,0,0,1,0,1,0,1,0,0,1,0]
    }
}
