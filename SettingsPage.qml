import QtQuick 2.15
import QtQuick.Layouts 1.3
import "qrc:/controls/" as Controls

Item {
    id: page
    Item{
//        scale: troubles
        anchors.left: parent.left
        anchors.top: parent.top

        anchors.margins: 50
        Text{
            id: title
            font.family: comfortaa_regular.font
            font.pointSize: 60
            color: theme.text_main
            text: qsTr("Настройки")
        }
        Column{
            id: settingsCol
            anchors.top: title.bottom
            anchors.topMargin: 65 - dy
            spacing: 15
            Controls.SettingsBox{type: "switch"; _text: qsTr("Темная тема")}
            Controls.SettingsBox{type: "tap"; _text: qsTr("Перевод приложения")}
       }

       Row{
           anchors.top: settingsCol.bottom
           anchors.topMargin: 65
           spacing: 100 + dx/5
           Column{
               spacing: 15 + dy
               Text{
                   id: title_author
                   font.family: comfortaa_regular.font
                   font.pointSize: 40
                   color: theme.text_main
                   text: qsTr("Автор")
               }
               Controls.PersonCard{
                   personName: qsTr("Джон Конвей");
                   personData: qsTr("Английский математик, 1970 г.");
                   personImageURL: ""
               }
           }
           Column{
               spacing: 15 + dy
               Text{
                   id: title_programmers
                   font.family: comfortaa_regular.font
                   font.pointSize: 40
                   color: theme.text_main
                   text: qsTr("Разработчики")
               }
               Controls.PersonCard{
                   personName: qsTr("Nestik_55");
                   personData: qsTr("Шильников Дмитрий Денисович, программист, автор идеи");
                   personImageURL: ""
               }
               Controls.PersonCard{
                   personName: qsTr("toniess");
                   personData: qsTr("Глушков Игнатий Игоревич, программист, дизайнер");
                   personImageURL: ""
               }
           }
       }
    }

}
