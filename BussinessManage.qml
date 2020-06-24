import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import Business 1.0

Item {
    Business{
        id:business
    }
    ToolBar {
        id:toolbar
        ToolButton {
            text: qsTr("‹")
            onClicked: login.pop()
        }
    }
    ColumnLayout{
        id:column
        anchors.top: toolbar.bottom
        RowLayout{
            id:row
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
            ColumnLayout{
                y: 8
                anchors.leftMargin: 114
                anchors.left: imageView.right
                Button {
                    id: button2
                    x: 0
                    y: 110
                    width: 90
                    height: 40
                    text: qsTr("选择商铺图片")
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
                        imageView.source = fileUrl
                    }
                }
                Button {
                    id: button
                    text: qsTr("添加商铺")
                    onClicked: {
                        business.addBusiness(businessname.text,fileDialog.fileUrl,business_info.text)
                        console.log("注册成功")
                    }
                }
            }
        }
    }
    ListView{
        id: listview
        width: parent.width
        height: parent.height
        anchors.rightMargin: 0
        anchors.bottomMargin: -177
        anchors.leftMargin: 0
        anchors.topMargin: 177
        anchors.fill: parent
        delegate: listDelegate

    }
    Component.onCompleted: {
       business.getblist()
    }
    Component{
        id: listDelegate
        Rectangle{
            id: listItem
            width: parent.width
            height: 30

            Text {
                id: text5
                font.family: "microsoft yahei"
                font.pointSize: 12
                height: parent.height
                width: parent.width - delBtn.width
                text: model.modelData.name
                color: "green"
                verticalAlignment: Text.AlignVCenter
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
                        //listview.model.remove(index);
                        business.remove(text5.text)
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
                from: 60
                to: 0
            }
        }
    }
    Connections{
        target: business
        onSignalbList:{
            listview.model=data;
        }
    }
}
