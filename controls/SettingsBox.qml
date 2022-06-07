import QtQuick 2.0

Rectangle {
    id: box
    property string _text

    property string type // switch or tap

    Component.onCompleted: {
        var contentItem
        if (type === "tap")
            contentItem = tapBox.createObject(box);
        else if (type === "switch")
            contentItem = switchBox.createObject(box);

        contentItem.anchors.verticalCenter = contentItem.parent.verticalCenter
        contentItem.anchors.left = box.left
        contentItem.anchors.margins = 20
        extraText.anchors.left = contentItem.right
        extraText.anchors.leftMargin = 10
        extraText.anchors.verticalCenter = contentItem.verticalCenter

    }

    width: 400
    height: 60
    radius: 22
    color: theme.bg_third

    Text{
        id: extraText
        color: theme.text_main
        font.family: comfortaa_regular.font
        font.pointSize: 20
        text: _text
    }

    Component{
        id: switchBox
        Rectangle{
            id: bg
            property bool on_left: true
            width: 75
            height: 38
            color: theme.bg_second
            radius: width
            Rectangle{
                id: round
                width: 30
                height: 30
                radius: 30
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    bg.on_left = !bg.on_left
                    anim.running = true
                    //change_theme(bg.on_left)
                }
            }
            NumberAnimation {
                id: anim
                target: round
                property: "anchors.leftMargin"
                to: bg.on_left? 5 : bg.width-35
                duration: 100
            }
        }
    }
    Component{
        id: tapBox
        Rectangle{
            id: bg
            width: 75
            height: 38
            color: theme.bg_second
            radius: width
            Text{
                id: text
                property bool state: false
                text: state? "EN" : "RU"
                font.family: comfortaa_semibold.font
                font.pointSize: 22
                color: "white"
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment:   Text.AlignVCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    text.state = !text.state
                    //translate_app(text.state)
                }
            }

        }
    }
}
