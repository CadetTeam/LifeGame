import QtQuick 2.9
import QtQuick.Shapes 1.15

Item {
    id: svg2qml
    property bool thinkLines: false
    Item {
        width: parent.width
        height: parent.height
        transformOrigin: Item.TopLeft
        transform: Matrix4x4 {matrix: Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
        Shape {
            x: 151
            y: 179
            rotation: 0
            width: 246
            height: 122.00000000000001
            clip: false
            transformOrigin: Item.TopLeft
            ShapePath {
                PathSvg {
                    path: "M 20,0
                           C 8.9543,0 0,8.9543 0,20
                           L 0,93.5
                           C 0,98.1944 3.80558,102 8.5,102
                           C 13.1944,102 17,105.806 17,110.5
                           L 17,118.765
                           C 17,120.496 18.2691,122 20,122
                           L 226,122
                           C 237.046,122 246,113.046 246,102
                           L 246,20
                           C 246,8.9543 237.046,0 226,0
                           L 20,0 Z"
                }
                strokeColor: (svg2qml.thinkLines)? "#000000" : "transparent"
                strokeWidth: (svg2qml.thinkLines)? 1 : 0
                fillColor: (svg2qml.thinkLines)? "transparent" : "#66c4c4c4"
            }
            transform: Matrix4x4 {matrix: Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
        }
    }
}
