import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle{
    id: rectangle

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        width: 640
        height: 480


        Image {
            id: image
            width: parent.width/5
            height: width
            source: "images/nn23.png"
        }

        Text {
            id: element

            text: qsTr("Text")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 1111212    }

        Button {
            id: button
            width: 303
            height: 63
            text: qsTr("Button")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                loginpage.push("Signin.qml")
            }
        }

        Text {
            id: element1
            width: 303
            height: 11
            text: qsTr("注册")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 112
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    loginpage.push("Signup.qml")
                }

            }
        }


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
