import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Userdata 1.0

Item {

    TextField {
        id: username
        x: 131
        y: 105
        width: 365
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("用户名")
    }


    TextField {
        id: telenum
        x: 131
        y: 156
        width: 365
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("电话号码")
    }

    TextField {
        id: password
        x: 131
        y: 208
        width: 365
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("密码")
    }

    Button {
        id: regist_button
        x: 221
        y: 275
        text: qsTr("注册")
        onClicked: {

            if(user.isSignup(username.text))
            {
                console.log("用户已存在")

            }else{
                user.registInfo(username.text,telenum.text,password.text)
                console.log("注册成功")
                loginpage.pop()
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
