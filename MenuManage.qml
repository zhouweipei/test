import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import Business 1.0
import Menu 1.0
import QtQuick.Controls.Material 2.2

Item {
    property string businessName
    Menu{
        id:menu
    }
    ToolBar {
        id:toolbar
        ToolButton {
            text: qsTr("< "+businessName)
            onClicked:login.pop()
        }
    }
    ColumnLayout{
        id:column
        width: 370
        height: 40
        anchors.top: toolbar.bottom
        RowLayout{
            id:row
            TextField {
                id:name

                placeholderText: qsTr("请输入菜品名")
                font.pixelSize: 12
            }
            TextField {
                id: info
                placeholderText: qsTr("请输入菜品描述信息")
                font.pixelSize: 12
            }
        }
        Rectangle{
       //     anchors.top: row.bottom
            Image {
                id: imageView
                x: 0
                y: 40
                width: 150
                height: 104
                source: ""
                fillMode: Image.PreserveAspectFit
            }
            TextField {
                id: price
                y: 42
                anchors.left: imageView.right
                anchors.leftMargin: 54
                placeholderText: qsTr("请输入价格")
                font.pixelSize: 12
            }
            RowLayout{
                y: 88
                width: 200
                height: 43
                anchors.leftMargin: 54
                anchors.left: imageView.right
                Button {
                    id: button2
                    x: 0
                    y: 110
                    width: 90
                    height: 40
                    text: qsTr("上传菜品照片")
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            //打开文件
                            fileDialog.open()
                        }
                    }
                }
                FileDialog{
                    id:fileDialog
                    title:"请选择菜品"
                    nameFilters: ["Image Files(*.jpg *.png *.bmp)"]
                    onAccepted: {
                        imageView.source = fileUrl
                    }
                }
                MessageDialog{
                    id:messageDialog1
                    text: "请输入完整信息"
                    icon:StandardIcon.Warning
                    standardButtons: StandardButton.Ok
                }
                Button {
                    id: button
                    text: qsTr("添加菜品")
                    onClicked: {
                        if(name.text==""||info.text==""||price.text==""||fileDialog.fileUrl==""){
                            messageDialog1.open()
                        }
                        menu.addmenu(businessName,name.text,info.text,price.text,fileDialog.fileUrl)
                        name.text=""
                        info.text=""
                        price.text=""
                        imageView.source=""
                        menu.getmlist(businessName)
                    }
                }
            }
        }
    }

    ListView{
        id:menuList
        anchors.fill: parent
        width: parent.width
        height: parent.height
        anchors.rightMargin: 0
        anchors.bottomMargin: -190
        anchors.leftMargin: 0
        anchors.topMargin: 190
        delegate: listDelegate
        spacing: 5
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
                    id: textinfo
                    font.family: "microsoft yahei"
                    font.pointSize: 5
                    height: parent.height
                    width:parent.width/5
                    text: model.modelData.ingredients
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: textprice
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    height: parent.height
                    width:parent.width/5
                    text: '￥' + model.modelData.price
                    color: "red"
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    font.pointSize: 20
                    text: "+"
                    color: "red"
                    font.bold: true
                    height: parent.height
                    width:parent.width/5
                    MouseArea{
                        anchors.fill: parent
                        onClicked: menu.increase_price(businessName,textname.text,model.modelData.price)
                    }
                }
                Text{
                    font.pointSize: 20
                    text: "-"
                    color: "red"
                    font.bold: true
                    height: parent.height
                    width:parent.width/5
                    MouseArea{
                        anchors.fill: parent
                        onClicked: menu.decrease_price(businessName,textname.text,model.modelData.price)
                    }
                }
                Rectangle{
                    height: width
                    width:parent.width/10
                    Image{
                        anchors.verticalCenter: parent.verticalCenter
                        source:"file:///F:/text/fanfou/images/del.png"
                    }
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
    Component.onCompleted: {
        menu.getmlist(businessName)
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
