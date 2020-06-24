import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
Page{
    id:loginpage
    Rectangle {
        id: iconRect
        width: parent.width
        height: parent.height / 2.6

        Image {
            id: profilePic
            anchors.horizontalCenter: iconRect.horizontalCenter
            anchors.bottom: iconRect.bottom
            sourceSize.width: loginpage.width / 5.5
            sourceSize.height: loginpage.height / 5.5
            source: "file:///C:/Users/zwp/Pictures/1.png"

        }

    }
    Rectangle{
        id:rect
        anchors.top: iconRect.bottom
        anchors.topMargin: 20
        Pane{
            ColumnLayout{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 20
                anchors.horizontalCenterOffset: 50
                TextField {
                    id:username
                    placeholderText: "请输入用户名"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredWidth: 270
                    Layout.fillWidth: true
                }
                TextField {
                    id:telenum
                    placeholderText: "请输入电话号码"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredWidth: 270
                    Layout.fillWidth: true
                }

                TextField {
                    id:password
                    placeholderText: "请输入密码"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredWidth: 270
                    Layout.fillWidth: true
                    echoMode: TextField.Password
                }


                RowLayout {
                    Layout.alignment: Qt.AlignVCenter
                    Button {
                        text: "登录"
                        Layout.fillWidth: true
                        onClicked: {
                            if(!user.isSignup(username.text))
                            {
                                messageDialog.open()
                            }else
                             if(user.compare_login(username.text,telenum.text,password.text)){
                                console.log("登录成功")

                             }else{
                                 messageDialog1.open()
                             }
                        }
                    }
                    MessageDialog{
                        id:messageDialog
                        text: "用户未注册"
                        icon:StandardIcon.Warning
                        standardButtons: StandardButton.Ok
                    }
                    MessageDialog{
                        id:messageDialog2
                        text: "用户以注册"
                        icon:StandardIcon.Warning
                        standardButtons: StandardButton.Ok
                    }
                    MessageDialog{
                        id:messageDialog1
                        text: "密码错误"
                        icon:StandardIcon.Warning
                        standardButtons: StandardButton.Ok
                    }
                    MessageDialog{
                        id:messageDialog3
                        text: "注册成功"
                        icon:StandardIcon.Warning
                        standardButtons: StandardButton.Ok
                    }

                    Button {
                        text: "注册"
                        Layout.fillWidth: true
                        onClicked: {
                            if(user.isSignup(username.text))
                            {
                                messageDialog2.open()
                            }else{
                                user.registInfo(username.text,telenum.text,password.text)
                                messageDialog3.open()
                                console.log("注册成功")
                            }
                        }


                    }
                }

                Button {
                    Layout.fillWidth: true
                    text: "管理员登录"
                    onClicked: {
                    login.push("BussinessManage.qml")
                    }
                }
            }
        }
    }


}
