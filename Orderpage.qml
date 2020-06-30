import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
Item {
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
        height: 101
        color: "#ffffff"
        radius: 10
        border.color: "#e72929"
        border.width: 2
        anchors.top: toolbar.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        TextField {
            text:"111"
            id: address
            height: 40
            placeholderText: "请输入地址"
            horizontalAlignment: Text.AlignLeft
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
        }

        TextField {
            id: name
            width: parent.width/3
            height: 40
            placeholderText: "请输入收货人姓名"
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: address.bottom
            anchors.topMargin: 6
        }

        TextField {
            width: parent.width/2
            height: 40
            text: qsTr("")
            anchors.right: parent.right
            anchors.rightMargin: 72
            id: tel
            x: 248
            placeholderText: "请输入收货人电话号码"
            anchors.top: address.bottom
            anchors.topMargin: 6
        }


    }

    Rectangle {
        id: select_rectangle
        height: 78
        color: "#ffffff"
        anchors.top: rectangle.bottom
        anchors.topMargin: 6
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        TextField {
            id: name_dish
            width: parent.width/4
            height: 40
            placeholderText:"请输入菜名"
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 16
        }

        TextField {
            id: num
            width: parent.width/5
            height: 40
            placeholderText:"请输入数量"
            anchors.left: name_dish.right
            anchors.leftMargin: 19
            anchors.top: parent.top
            anchors.topMargin: 16
        }

        Button {
            id: button
            text: qsTr("添加到购物车")
            anchors.left: num.right
            anchors.leftMargin: 21
            anchors.top: parent.top
            anchors.topMargin: 19
        }
    }
    ListView{
        id:orderList
        width: parent.width
        height: parent.height
        anchors.top: select_rectangle.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 5
        spacing: 5
        delegate: listDelegate
    }
    Component{
        id:listDelegate
        Rectangle{
            border.color: "lightblue"
            id:listItem
            width: menuList.width
            height: 50
            Image{
                id:pic
                height: parent.height
                width: height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin:10
                source: model.modelData.image
            }
            RowLayout {
                id: content
                anchors.top: parent.top
                anchors.left: pic.right
                anchors.leftMargin: 5
                anchors.topMargin: 15
                width: parent.width - pic.width - 50
                height: parent.height
                spacing: 5
                Text {
                    id: textname
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    height: parent.height
                    width:parent.width/5
                    text: model.modelData.name
                    color: "green"
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    font.family: "microsoft yahei"
                    font.pointSize: 20
                    height: parent.height
                    width:parent.width/5
                    text: "✖"
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: textnum
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    height: parent.height
                    width:parent.width/5
                    text: '￥' + model.modelData.price
                    color: "red"
                    verticalAlignment: Text.AlignVCenter
                }
                Rectangle{
                    height: width
                    width:parent.width/10
                    Image{
                        anchors.verticalCenter: parent.verticalCenter
                        source:"file:///F:/text/fanfou/images/del.png"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            menu.delete_menu(businessName,textname.text)
                        }
                    }
                }

            }

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:5;anchors_y:54}D{i:6;anchors_y:54}D{i:9;anchors_x:394}
D{i:10;anchors_x:521}
}
##^##*/
