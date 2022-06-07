import QtQuick 2.15

Item {

    property string lineName: ""
    readonly property var status_colors: {
        "empty": "#C4C4C4",
        "good": "#49E015",
        "bad": "#F05151"
    }

    property string status_
    onStatus_Changed: {
        inputBorder.color = status_
        changeButtonStatus(status_ === status_colors.good)
        if(status_ !== status_colors.good) showWarning("uniq_err")
    }
    function changeButtonStatus(status){}

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
            id: inputBorder
            width: parent.width - name.width - row.spacing
            height: parent.height
            radius: parent.height

            Rectangle {
                anchors.fill: parent
                anchors.margins: parent.height / 10
                radius: parent.radius
                color: theme.background
                clip: true

                TextInput{
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    maximumLength: 25
                    font: comfortaa_light.name
                    text: fileManager.getStandartWorldName()
                    color: "grey"
                    onTextChanged: {
                        warning.visible = false
                        if(fileManager.nameAvailable(text))
                            status_ = status_colors.good
                        else
                            status_ = status_colors.bad
                    }
                }
            }
        }
    }
    function showWarning(err_code)
    {
        if (err_code === "uniq_err")
        {
            warning.text = qsTr("*Имя должно быть уникальным");
        }
        else
        {
            warning.text = qsTr("*Не удалось создать мир. Попробуйте другое имя");
        }
        warning.visible = true
    }

    Connections{
        target: mainWindow
        function onWarning(err_code){showWarning(err_code)}
    }

    Text {
        id: warning
        visible: false
        x: inputBorder.x
        anchors.top: row.bottom
        anchors.topMargin: height
        horizontalAlignment: Text.AlignLeft
        color: status_colors.bad
        font.family: comfortaa_light.name
        font.pointSize: 12
        text: qsTr("*Имя должно быть уникальным")
    }
}
