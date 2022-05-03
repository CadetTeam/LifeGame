import QtQuick 2.0

Item {

    property string lineName: ""
    readonly property var status_colors: {
        "empty": "#C4C4C4",
        "good": "#49E015",
        "bad": "#F05151"
    }

    Component.onCompleted: {
        status = status_colors.empty
    }

    property var status

    Row{
        id: row
        anchors.fill: parent
        spacing: name.height
        Text {
            id: name
            anchors.verticalCenter: parent.verticalCenter
            font.family: comfortaa_medium.name
            color: theme.text_main
            text: lineName
            font.pointSize: 16
        }

        Rectangle{
            width: parent.width - name.width - row.spacing
            height: parent.height
            radius: parent.height
            color: status
            Rectangle {
                anchors.fill: parent
                anchors.margins: parent.height / 10
                radius: parent.radius
                color: theme.background
                TextInput{
                    anchors.fill: parent
                }
            }
        }
    }
}
