import QtQuick 2.0

Item {

    width: header.width
    height: header.height + text.height
    Column {
        spacing: 20 * scale_ratio_y
        anchors.fill: parent
        Text {
            id: header
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: comfortaa_regular.name
            text: qsTr("Добро пожаловать!")
            Component.onCompleted: {
                font.pointSize = 60 * scale_ratio_x
            }
            color: "black"
        }
        Text {
            id: text
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: comfortaa_light.name
            text: qsTr("Игра «Жизнь» — клеточный автомат,
придуманный английским математиком
Джоном Конвеем в 1970 году.
Создавайте свои миры и наслаждайтесь!")
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 1.4
            Component.onCompleted: {
                font.pointSize = 20 * scale_ratio_x
            }
            color: "black"
        }
    }
}
