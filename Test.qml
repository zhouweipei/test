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
    property var priceArray:[]
    property string businessName
    property string businessInfo
    property string businessImage
    property int num: getRandomNum(10,50)
    property double total_price
    property double e_price:0
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
            width: parent.width/5

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

        Button {
            id: button2
            width: 58
            height: 40
            text: qsTr("关注")
            anchors.left: element.right
            anchors.leftMargin: 77
            anchors.top: parent.top
            anchors.topMargin: 5
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
    ListModel{
        id:my_model
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
            Button {
                id: button
                width: 26
                height: 28
                text: qsTr("➖")
                anchors.left: element3.right
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 28

                onClicked: {
                    if(element10.text!=0)
                    {

                        element10.text--
                       var amount= element10.text
                    }
                    console.log(amount)
                }

            }
            Rectangle {
                id: rectangle3
                width: 41
                height: 41
                color: "#ffffff"
                anchors.left: button.right
                anchors.leftMargin: 13
                anchors.top: parent.top
                anchors.topMargin: 22

                Text {
                    id: element10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    font.pixelSize: 12
                    MouseArea{
                        anchors.fill: parent
                        onClicked: console.log(element10.text)
                    }
                }

            }
            Button {
                id: button1
                width: 25
                height: 28
                text: qsTr("➕")
                anchors.left: rectangle3.right
                anchors.leftMargin: 12
                anchors.top: parent.top
                anchors.topMargin: 28
                onClicked: {
                    element10.text++
                }
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
        color: "#322222"
        radius: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Button {
            id: button

            text: qsTr("去支付")
            anchors.left: parent.left
            anchors.leftMargin: 201
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            onClicked: {
                storePage.push("Orderpage.qml",{businessName:businessName})
            }
        }
//        Repeater{
//            model: my_model
            Text {
                id: element6
                width: 58
                height: 20
                anchors.left: parent.left
                anchors.leftMargin: 51
                anchors.top: parent.top
                anchors.topMargin: 16
                font.pixelSize: 20
                text: "￥"
                color: "red"
            }
        //}
    }
    Component.onCompleted: {
        menu.getmlist(businessName)


    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_height:480}D{i:10;anchors_x:19}
D{i:11;anchors_height:40;anchors_x:538;anchors_y:25}D{i:5;anchors_y:8}D{i:4;anchors_x:19}
D{i:15;anchors_x:0}D{i:12;anchors_x:0}D{i:16;anchors_x:0;anchors_y:0}D{i:17;anchors_x:154;anchors_y:17}
D{i:20;anchors_x:438;anchors_y:23}D{i:27;anchors_height:12;anchors_width:58;anchors_x:51;anchors_y:16}
D{i:26;anchors_width:65;anchors_x:158;anchors_y:4}D{i:19;anchors_x:198;anchors_y:55}
D{i:18;anchors_x:192;anchors_y:37}
}
##^##*/
