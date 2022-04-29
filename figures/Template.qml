import QtQuick 2.0

Item {
    id: figure
    property int rows_
    property int size_
    property int radius_: 0
    property var template_: []

    onSize_Changed: {
        width = size_
        height = size_
    }

    onTemplate_Changed: {
        rows_ = Math.ceil(Math.sqrt(template_.length))
        for(let i = 0; i < rows_**2 - template_.length; i++)
        {
            template_.push(0)
        }
    }

    Grid{
        anchors.fill: parent
        rows: rows_
        columns: rows
        spacing: figure.width / rows_ / 50

        Repeater{
            model: template_
            delegate: Rectangle{
                width: figure.width/rows_
                height: width
                radius: radius_
                color: Boolean(modelData)? theme.cell_alive : theme.cell_dead
            }
        }
    }
}
