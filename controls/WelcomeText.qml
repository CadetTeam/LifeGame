import QtQuick 2.15

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
            color: theme.text_main
            font.pointSize: 65
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
            font.pointSize: 25
            color: theme.text_main
        }
    }
}
