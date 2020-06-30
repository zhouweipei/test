import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0
Rectangle{
    property string userName
    property string userTel
    id: rectangle
    anchors.fill: parent
    
    Image {
        id: image
        width: 93
        height: 79
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        fillMode: Image.PreserveAspectFit
        source: "file:///C:/Users/zwp/Pictures/1.png"
    }
    
    Text {
        id: element
        width: 153
        height: 12
        text: userName
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.left: image.right
        anchors.leftMargin: 0
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 20
        font.bold: true
    }
    
    Text {
        id: element1
        width: 153
        height: 12
        text: userTel
        anchors.left: image.right
        anchors.leftMargin: 0
        anchors.top: element.bottom
        anchors.topMargin: 6
        font.pixelSize: 12
    }

    Column {
        id: column
        spacing: 20
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: image.bottom
        anchors.topMargin: 13

        Text {
            width:parent.width
            id: element2
            text: qsTr("我的订单")
            font.pixelSize: 12
        }

        Text {
            width:parent.width
            id: element3
            text: qsTr("修改密码")
            font.pixelSize: 12
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    login.push("Signup.qml")
                }
            }
        }

        Text {
            width:parent.width
            id: element4
            text: qsTr("退出登录")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    login.pop("Loginpage.qml")
                }
            }
        }
    }

}


