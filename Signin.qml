import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Userdata 1.0
Item {


    id: element

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent




        TextField {
            id: textEdit2
            width: 432
            height: 40
            placeholderText: qsTr("请输入用户名")
            font.pixelSize: 12
        }
        TextField {
            id: textEdit
            width: 432
            height: 39
            placeholderText: qsTr("请输入电话号码")
            font.pixelSize: 12
        }
        TextField {
            id: textEdit1
            width: 432
            height: 36
            placeholderText: qsTr("请输入密码")
            font.pixelSize: 12
        }

        Button {
            id: button
            text: qsTr("登录")
            onClicked: {
                if(!user.isSignup(textEdit2.text)){
                    console.log("用户未注册")
                }else
                if(user.compare_login(textEdit2.text,textEdit.text,textEdit1.text)){
                    console.log("登录成功")
                    console.log(user.username)
                    loginpage.push("Businesspage.qml")
                }else{
                    console.log("密码错误")

                }
            }
        }
    }
}
