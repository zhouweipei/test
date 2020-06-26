import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import Userdata 1.0
import Business 1.0
ApplicationWindow {
    property alias user: user
    property alias business: business
    Userdata{
        id:user
    }
    Business{
        id:business
        Component.onCompleted: {
            business.getblist()
        }
    }
    visible: true
    width: 400
    height: 800
    title: qsTr("fanfou")
    id:frmWindow
    footer: BaseTabBar{
        id:bar
        height: 48
        width: parent.width
        //--------》》》》
        Component.onCompleted: {
            myModel.append({"modelText":"首页","modelColor":"#000000","modelColorG":"#148014","modelSrc":"qrc:/images/Chat_MsgRecord.svg", "modelSrcG": "qrc:/images/Chat_MsgRecordG.svg"})
            myModel.append({ "modelText": "订单", "modelColor": "#000000", "modelColorG": "#148014", "modelSrc": "qrc:/images/Chat_FriendManager.svg", "modelSrcG": "qrc:/images/Chat_FriendManagerG.svg"})
            myModel.append({ "modelText": "我的", "modelColor": "#000000", "modelColorG": "#148014", "modelSrc": "qrc:/images/Main_P2PChat.svg", "modelSrcG": "qrc:/images/Main_P2PChatG.svg"})
           // myModel.append({ "modelText": "我的", "modelColor": "#000000", "modelColorG": "#148014", "modelSrc": "qrc:/images/Main_P2PChat.svg", "modelSrcG": "qrc:/images/Main_P2PChatG.svg"})
        }
    }

    SwipeView{
        id:view
        height: frmWindow.height-bar.height
        width: parent.width
        currentIndex: bar.currentIndex
        interactive: false

        StackView{
            id:storePage
            initialItem: storeModel
        }
        Component{
            id:storeModel
            Test1{}
        }
//        Component{
//            id:testmodel
//            Test{}
//        }
        Rectangle{

            color: "blue"

        }
        StackView{
            id:login
            initialItem: loginPage
        }
        Component{
            id:loginPage
            Loginpage{}
        }

    }

}

