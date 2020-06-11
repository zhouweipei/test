import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    ToolBar {
        id:toolbar
        ToolButton {
            text: qsTr("‹")
            onClicked: storePage.pop()
        }
    }

    Rectangle {
        id: rectangle
        anchors.top: toolbar.bottom
        width: parent.width
        height: 105
        color: "#ffffff"

        Image {
            id: image
            width: 115
            height: 105
            source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: element
            x: 207
            y: 8
            width: 211
            height: 38
            text: qsTr("storename")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }

        Text {
            id: element1
            x: 128
            y: 52
            width: 409
            height: 32
            text: qsTr("Text")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:5;anchors_y:8}
}
##^##*/
