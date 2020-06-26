import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import Business 1.0
import Menu 1.0

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
            anchors.top: row.bottom
            Image {
                id: imageView
                width: 150
                height: 104
                source: ""
                fillMode: Image.PreserveAspectFit
            }
            TextField {
                id: price
                y: 8
                anchors.left: imageView.right
                anchors.leftMargin: 54
                placeholderText: qsTr("请输入价格")
                font.pixelSize: 12
            }
            RowLayout{
                y: 54
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
        anchors.bottomMargin: -177
        anchors.leftMargin: 0
        anchors.topMargin: 177
        delegate: listDelegate
    }
    Component{
        id:listDelegate
        Rectangle{
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
                anchors.leftMargin: 30
                anchors.topMargin: 15
                width: parent.width - pic.width - 50
                height: parent.height
                spacing: 1
                Text {
                    id: textname
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    height: parent.height
                    width: parent.width - delBtn.width
                    text: model.modelData.name
                    color: "green"
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    id: textinfo
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    height: parent.height
                    width: parent.width - delBtn.width
                    text: model.modelData.ingredients
                    color: "green"
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: textprice
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    height: parent.height
                    width: parent.width - delBtn.width
                    text: '$' + model.modelData.price
                    font.bold: true
                    color: "green"
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    id: set
                    text: qsTr("<⭐>")
                    MouseArea{
                        property point clickPos: "0,0"
                        anchors.fill: parent
                        onPressed: {
                            clickPos  = Qt.point(mouse.x,mouse.y);
                        }
                        onReleased: {
                            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                            if ((delta.x < 0) && (aBtnShow.running === false) && (delBtn.width == 0)){
                                aBtnShow.start();
                            }else if (aBtnHide.running === false && (delBtn.width > 0)){
                                aBtnHide.start();
                            }
                        }
                    }
                }
            }
            Rectangle{
                color: "#AAAAAA"
                height: 1
                width: parent.width
                anchors.bottom: parent.bottom
            }
            Rectangle{
                id: delBtn
                height: parent.height
                width: 0
                color: "#EE4040"
                anchors.right: parent.right
                Text {
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    anchors.centerIn: parent
                    text: qsTr("删除")
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
            PropertyAnimation{
                id: aBtnShow
                target: delBtn
                property: "width"
                duration: 100
                from: 0
                to: 60
            }
            PropertyAnimation{
                id: aBtnHide
                target: delBtn
                property: "width"
                duration: 100
                from: 0
                to: 60
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
