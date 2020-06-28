import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Menu 1.0

Item {
    function getRandomNum(Min,Max)
    {
        var Range = Max - Min;
        var Rand = Math.random();
        return(Min + Math.round(Rand * Range));
    }
    property string businessName
    property string businessInfo
    property string businessImage
    property int num: getRandomNum(10,50)
    id: element5

    Menu{
        id:menu
    }
    ToolBar {
        id:toolbar
        ToolButton {
            text: qsTr("‹")
            onClicked: storePage.pop()
        }
    }

    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height/5
        color: "#fdfbfb"
        radius: 20
        anchors.top: toolbar.bottom
        anchors.topMargin: 6
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#fdfbfb"
            }

            GradientStop {
                position: 1
                color: "#ebedee"
            }
        }

        Image {
            id: image

            width: 50
            height: width
            anchors.verticalCenterOffset: 2
            anchors.left: parent.left
            anchors.leftMargin: 24
            anchors.verticalCenter: parent.verticalCenter
            source:businessImage
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: element
            width: parent.width/5*3

            height: 38
            text: businessName
            font.bold: true
            anchors.left: image.right
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 5
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }

        Text {
            id: element1

            width: parent.width/5*3
            height: 26
            text: businessInfo
            anchors.top: element.bottom
            anchors.topMargin: 6
            anchors.left: image.right
            anchors.leftMargin: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }
    }
    Rectangle {
        id: rectangle1

        width: parent.width/5*3
        height: 29
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 27
        anchors.top: rectangle.bottom
        anchors.topMargin: 20

        Label {
            id: label
            x: 19
            y: 14
            text: qsTr("点菜")
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            id: label1
            x: 78
            y: 14
            text: qsTr("套餐")
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            id: label2
            x: 143
            y: 14
            text: qsTr("评价")
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    ListView{
        id:menuList
        width: parent.width
        height: parent.height
        anchors.top: rectangle1.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: -191
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.topMargin: 6
        delegate: listdelegate
        spacing: 5
    }
    Component{
        id:listdelegate
        Rectangle {
            id: rectangle2

            width: parent.width
            height: 100
            color: "#ffffff"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: rectangle1.bottom
            anchors.topMargin: 6

            Image {
                id: image1
                width: height
                height: parent.height
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 30
                source: model.modelData.image
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: element2
                width: parent.width/3
                height: 22
                text: model.modelData.name
                anchors.left: parent.left
                anchors.leftMargin: 154
                anchors.top: parent.top
                anchors.topMargin: 13
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            Text {
                id: element3
                width: parent.width/3
                height: 14
                text: "月售"+num
                anchors.left: parent.left
                anchors.leftMargin: 148
                anchors.top: element2.bottom
                anchors.topMargin: 6
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            Text {
                id: element4
                width:parent.width/3
                height: 21
                text: '￥' + model.modelData.price
                color: "red"
                anchors.left: parent.left
                anchors.leftMargin: 142
                anchors.top: element3.bottom
                anchors.topMargin: 6
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            SpinBox {
                id: spinBox
                anchors.top: parent.top
                anchors.topMargin: 33
                anchors.left: element3.right
                anchors.leftMargin: -12
            }
        }
    }
    Connections{
        target: menu
        onSignalmList:{
            menuList.model=data;
        }
    }

    Rectangle {
        id: rectangle3
        x: 79
        y: 428
        width: 266
        height: 44
        color: "#171313"
        radius: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Button {
            id: button

            text: qsTr("支付")
            anchors.left: parent.left
            anchors.leftMargin: 201
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Text {
            id: element6
            width: 58
            height: 20
            //text: "￥"+parseInt(element4.text)*spinBox.value
            color: "red"
            anchors.left: parent.left
            anchors.leftMargin: 51
            anchors.top: parent.top
            anchors.topMargin: 16
            font.pixelSize: 12
        }
    }
    Component.onCompleted: {
        menu.getmlist(businessName)
       // console.log(menuList.model.modelData)
    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_height:480}D{i:5;anchors_y:8}
D{i:10;anchors_x:19}D{i:4;anchors_x:19}D{i:14;anchors_x:0}D{i:11;anchors_x:0}D{i:15;anchors_x:0;anchors_y:0}
D{i:18;anchors_x:198;anchors_y:55}D{i:19;anchors_x:438;anchors_y:23}D{i:17;anchors_x:192;anchors_y:37}
D{i:16;anchors_x:154;anchors_y:17}D{i:25;anchors_width:65;anchors_x:158;anchors_y:4}
D{i:26;anchors_height:12;anchors_width:58;anchors_x:51;anchors_y:16}
}
##^##*/
