import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Userdata 1.0
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3
Item {
    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        TextField {
            id: businessname
            width: 432
            height: 40
            placeholderText: qsTr("请输入店名")
            font.pixelSize: 12
        }
        TextField {
            id: business_info
            width: 432
            height: 36
            placeholderText: qsTr("请输入店铺信息")
            font.pixelSize: 12
        }
        Rectangle {
            id: rectangle
            width: 150
            height: 150
            color: "#ffffff"

            Image {
                id: imageView
                width: 150
                height: 104
                source: ""
                fillMode: Image.PreserveAspectFit
            }

            Button {
                id: button2
                x: 0
                y: 110
                width: 90
                height: 40
                text: qsTr("选择文件")
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
                title:"请选择您要展示的图片"
                nameFilters: ["Image Files(*.jpg *.png *.bmp)"]
                onAccepted: {
                    console.log(fileUrl)
                    //pathText.text = fileUrl
                    imageView.source = fileUrl
                }
                onRejected: {
                    console.log("用户取消了选择")
                }
            }
        }
        Button {
            id: button
            text: qsTr("注册")
            onClicked: {
                business.addBusiness(businessname.text,business_password.text,fileDialog.fileUrl,business_info.text)
                console.log("注册成功")
            }
        }
        TextField {
            id: dish_name
            width: 432
            height: 36
            placeholderText: qsTr("请输入菜名")
            font.pixelSize: 12
        }
        TextField {
            id: ingredient
            width: 432
            height: 36
            placeholderText: qsTr("请输入配料")
            font.pixelSize: 12
        }
        TextField {
            id: price
            width: 432
            height: 36
            placeholderText: qsTr("请输入价格")
            font.pixelSize: 12
        }
        Button {
            id: button1
            text: qsTr("添加菜品")
            onClicked: {
                business.addmenu(businessname.text,dish_name.text,ingredient.text,price.text)
                console.log("注册成功")
                console.log(parseInt(price.text)+5)
            }
        }


    }
}
