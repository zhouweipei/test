import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
Item {
    ToolBar {
        id:toolbar
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        ToolButton {
            text: qsTr("‹")
            onClicked: login.pop()
        }
    }
    id: element
    ListView{
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 36
        anchors.fill: parent
        model: StoreList{}
        spacing: 10
        delegate:  Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 640
            height: 188
            color: "#ffffff"

            Image {
                id: image
                width: 58
                height: 57
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.top: parent.top
                anchors.topMargin: 17
                source: srcImage
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: label
                width: 146
                height: 27
                text: storeName
                anchors.left: image.right
                anchors.leftMargin: 25
                anchors.top: parent.top
                anchors.topMargin: 26
                font.bold: true
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: label1
                x: 537
                text: qsTr("订单以完成")
                anchors.right: parent.right
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.topMargin: 32
            }

            ToolSeparator {
                id: toolSeparator
                height: 5
                anchors.left: image.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 6
                anchors.top: label1.bottom
                anchors.topMargin: 20
            }

            Text {
                id: label2
                width: 243
                height: 22
                text: shopping
                anchors.left: parent.left
                anchors.leftMargin: 91
                anchors.top: toolSeparator.bottom
                anchors.topMargin: 13
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Text {
                id: label3
                x: 556
                width: 69
                height: 21
                text: money
                anchors.top: toolSeparator.bottom
                anchors.topMargin: 33
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle {
                id: rectangle1
                x: 426
                y: 140
                width: 73
                height: 40
                color: "#ffffff"
                anchors.right: rectangle2.left
                anchors.rightMargin: 53
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                border.width: 2

                Text {
                    id: element2
                    text: qsTr("再来一单")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle2
                x: 552
                y: 140
                width: 73
                height: 40
                color: "#fbbc10"
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8

                Text {
                    id: element3
                    text: qsTr("去评论")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    font.pixelSize: 12
                }
            }

        }
    }


}
