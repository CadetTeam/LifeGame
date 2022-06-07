import QtQuick 2.0

Rectangle {
    property string personName
    property string personData
    property string personImageURL

    width: 500
    height: 140
    radius: 30

    color: theme.bg_third

    Row{
        anchors.fill: parent
        spacing: (parent.height - frame.height)/2
        anchors.leftMargin: spacing
        Rectangle{
            id: frame
            width:  100
            height: 100
            radius: 100
            color: theme.blue
            clip: true
            anchors.verticalCenter: parent.verticalCenter
            Image{
                anchors.fill: parent
                source: personImageURL
            }
        }
        Column{
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5
            Text{
                id: name
                font.family: comfortaa_regular.font
                font.pointSize: 30
                color: theme.text_main
                text: personName
                width: 500-140
            }
            Text{
                id: data
                font.family: comfortaa_regular.font
                font.pointSize: 16
                color: theme.text_main
                text: personData
                wrapMode: Text.Wrap
                width: 500-140
            }
        }
    }
}
