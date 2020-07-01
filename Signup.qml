import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import Userdata 1.0

Item {
    Userdata{
        id:user
    }
    TextField {
        id: telenum
        x: 131
        y: 156
        width: 365
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("请输入电话号码")
    }

    TextField {
        id: password
        x: 131
        y: 208
        width: 365
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("请输入新密码")
    }

    Button {
        id: regist_button
        x: 221
        y: 275
        text: qsTr("修改")
        onClicked: {
            user.change_password(telenum.text,password.text)
            messageDialog.open()
            login.pop()
        }
    }
    MessageDialog{
        id:messageDialog
        text: "修改成功"
        icon:StandardIcon.Warning
        standardButtons: StandardButton.Ok
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
