import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
Item {
    property string businessName
    id: order
    ToolBar {
        id:toolbar
        ToolButton {
            text: qsTr("‹")
            onClicked:storePage.pop()
        }


    }
    Rectangle {
        id: rectangle
        height: 132
        color: "#ffffff"
        radius: 10
        border.color: "#f2efef"
        border.width: 2
        anchors.top: toolbar.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Label {
            id: label
            text: qsTr("重庆师范大学大学城校区清风苑A栋")
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            font.pointSize: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.leftMargin: 8
            anchors.rightMargin: 0
        }

        Label {
            id: label1
            width: 90
            height: 25
            text: qsTr("周伟培 先生")
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: label.bottom
            anchors.topMargin: 6
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

        Label {
            id: label2
            width: 160
            height: 25
            text: qsTr("13452797144")
            anchors.top: label.bottom
            anchors.topMargin: 6
            anchors.left: label1.right
            anchors.leftMargin: 49
            verticalAlignment: Text.AlignVCenter
        }

        ToolSeparator {
            id: toolSeparator
            x: 0
            y: 105
            height: 5
            anchors.top: label2.bottom
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        Label {
            id: label3
            text: qsTr("立即送出")
            anchors.top: toolSeparator.bottom
            anchors.topMargin: 14
            anchors.left: parent.left
            anchors.leftMargin: 14
        }

        Label {
            id: label4
            x: 508
            width: 104
            height: 15
            color: "#4095ea"
            text: qsTr("大约20：30送达")
            anchors.right: parent.right
            anchors.rightMargin: 28
            anchors.top: toolSeparator.bottom
            anchors.topMargin: 22
        }

        Label {
            id: label5
            x: 618
            width: 15
            height: 15
            text: qsTr(">")
            anchors.top: toolSeparator.bottom
            anchors.topMargin: 22
            anchors.right: parent.right
            anchors.rightMargin: 7
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
        }


    }

    Rectangle {
        id: select_rectangle
        height: 259
        color: "#ffffff"
        radius: 5
        border.color: "#fff7f7"
        border.width: 3
        anchors.top: rectangle.bottom
        anchors.topMargin: 6
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Label {
            id: label6
            width: 107
            height: 27
            text: businessName
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 8
        }

        Rectangle {
            id: rectangle1
            x: 569
            width: 45
            height: 23
            color: "#ffffff"
            radius: 3
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 8
            border.width: 1

            Text {
                id: element1
                text: qsTr("美团跑腿")
                font.family: "Tahoma"
                anchors.fill: parent
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 10
            }
        }

        ToolSeparator {
            id: toolSeparator1
            height: 5
            anchors.top: label6.bottom
            anchors.topMargin: 6
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        Image {
            id: image
            width: 62
            height: 61
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: toolSeparator1.bottom
            anchors.topMargin: 13
            source: "file:///C:/Users/zwp/Pictures/1.png"
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: label7
            width: 178
            height: 15
            text: qsTr("老八秘制小汉堡")
            anchors.left: image.right
            anchors.leftMargin: 16
            anchors.top: toolSeparator1.bottom
            anchors.topMargin: 13
        }

        Label {
            id: label8
            x: 93
            y: 105
            text: qsTr("X 1")
        }

        Label {
            id: label9
            x: 579
            text: qsTr("￥25")
            font.bold: true
            anchors.right: parent.right
            anchors.rightMargin: 31
            anchors.top: toolSeparator1.bottom
            anchors.topMargin: 13
        }

        Label {
            id: label10
            text: qsTr("打包费")
            anchors.left: parent.left
            anchors.leftMargin: 27
            anchors.top: image.bottom
            anchors.topMargin: 17
        }

        Label {
            id: label11
            text: qsTr("配送费")
            anchors.top: label10.bottom
            anchors.topMargin: 6
            anchors.left: parent.left
            anchors.leftMargin: 27
        }

        Label {
            id: label12
            x: 572
            text: qsTr("￥ 3")
            anchors.top: toolSeparator1.bottom
            anchors.topMargin: 91
            anchors.right: parent.right
            anchors.rightMargin: 38
        }

        Label {
            id: label13
            x: 572
            width: 30
            height: 15
            text: qsTr("￥ 0")
            anchors.top: label12.bottom
            anchors.topMargin: 6
            anchors.right: parent.right
            anchors.rightMargin: 38
        }

        ToolSeparator {
            id: toolSeparator2
            x: -9
            height: 5
            anchors.leftMargin: 0
            anchors.top: label13.bottom
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.topMargin: 15
        }

        Label {
            id: label14
            width: 66
            height: 23
            text: qsTr("美团红包")
            anchors.left: parent.left
            anchors.leftMargin: 27
            anchors.top: toolSeparator2.bottom
            anchors.topMargin: 6
        }

        Label {
            id: label15
            width: 76
            height: 15
            text: qsTr("商家代金券")
            anchors.left: parent.left
            anchors.leftMargin: 27
            anchors.top: label14.bottom
            anchors.topMargin: 10
        }

        Label {
            id: label16
            x: 547
            width: 69
            height: 15
            text: qsTr("暂无可用 >")
            horizontalAlignment: Text.AlignRight
            anchors.right: parent.right
            anchors.rightMargin: 24
            anchors.top: toolSeparator2.bottom
            anchors.topMargin: 14
        }

        Label {
            id: label17
            x: 547
            width: 70
            height: 15
            text: qsTr("暂无可用 >")
            horizontalAlignment: Text.AlignRight
            anchors.top: label16.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 23
        }
    }

    Rectangle {
        id: rectangle2
        width: 640
        height: 50
        color: "#1a1414"
        radius: 15
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        border.width: 2

        Button {
            id: button
            x: 532
            y: 6
            text: qsTr("去支付")
            wheelEnabled: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Rectangle {
            id: rectangle3
            x: 399
            width: 141
            color: "#fbbc10"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: button.left
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
        }

        Label {
            id: label18
            color: "#fafbfc"
            text: qsTr("￥28")
            anchors.left: parent.left
            anchors.leftMargin: 52
            anchors.top: parent.top
            anchors.topMargin: 20
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_x:134;anchors_y:54}D{i:5;anchors_x:8;anchors_y:54}
D{i:6;anchors_x:116;anchors_y:69}D{i:7;anchors_width:640;anchors_x:-8;anchors_y:-169}
D{i:8;anchors_x:394;anchors_y:83}D{i:9;anchors_x:521;anchors_y:91}D{i:10;anchors_y:91}
D{i:12;anchors_x:8;anchors_y:8}D{i:14;anchors_x:11;anchors_y:6}D{i:13;anchors_y:17}
D{i:15;anchors_width:632;anchors_x:0;anchors_y:41}D{i:16;anchors_x:15;anchors_y:59}
D{i:17;anchors_x:93;anchors_y:59}D{i:19;anchors_y:59}D{i:20;anchors_x:27;anchors_y:137}
D{i:21;anchors_x:27;anchors_y:158}D{i:22;anchors_y:137}D{i:23;anchors_y:158}D{i:24;anchors_width:632;anchors_x:0;anchors_y:201}
D{i:25;anchors_x:27;anchors_y:210}D{i:26;anchors_x:27;anchors_y:238}D{i:27;anchors_y:207}
D{i:28;anchors_y:232}
}
##^##*/
