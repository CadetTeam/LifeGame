import QtQuick 2.15

import "qrc:/figures/" as Figures

Item {
    id: anim

    property Figures.Template figure_1: figure1

    property Figures.Template figure_2: figure2

    visible: state != "null"

    property string state: "null"
    signal updateWelcomeTextY()

    function resizeContent(){
        var state_last = state
        state = "null"
        state = state_last
    }

    function running(){
        return animation.running
    }

    onStateChanged: {
        switch (state) {
        case "logo":
            go((mainPage.width-figure_1.width)/5, getWelcomeTextDownY(), figure_1.size_ * -0.2, mainPage.width - figure_2.width * 1.5, getWelcomeTextY() - figure_2.height, -120 + figure_2.size_ * 0.2, 400)
            break
        case "plus":
             go(mainPage.width - figure_1.width/1.2, mainPage.height - figure_1.height/1.3, -figure_1.size_ * -0.2, -figure_2.width/5, -figure_2.height/5, 10 + figure_2.size_ * 0.2, 400)
            break
        case "settings":
            go(figure_1.width/5, mainPage.height - figure_1.height/1.5, -360 + 25 -figure_1.size_ * -0.2, mainPage.width - figure_2.width, -figure_2.height/5, -360 + 40 + figure_2.size_ * 0.2, 400)
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



    Figures.Template {
        id: figure1
        size_: figure_2.size_ * 0.75
        template_: [0,1,0,0,0,1,1,1,1]
    }
    Figures.Template {
        id: figure2
        size_: Math.sqrt(mainPage.width * mainPage.height)/2.5
        template_: [0,1,1,0,1,0,0,1,0,1,0,1,0,0,1,0]
    }
}
