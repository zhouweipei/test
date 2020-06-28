import QtQuick 2.0
import QtQuick.Controls 2.1
import Business 1.0
Rectangle {
    property bool refreshFlag: false
    Business{
        id:business
    }
    Rectangle{
        width: parent.width
        height: -view.contentY
        color: "cyan"
        Label{
            anchors.centerIn: parent
            text:"下拉刷新"
            visible: view.contentYr
        }
    }

    BusyIndicator{
        id:busy
        z:4
        running: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/3.
        Timer{
            interval: 2000
            running: busy.running
            onTriggered: {
                busy.running = false
            }
        }
    }
    Component {
        id: dragDelegate
        Rectangle {
            color: "#F5F5DC"

            id: content
            anchors { left: parent.left; right: parent.right }
            height: column.implicitHeight +25
            border.color: "#FFFFF0"
            border.width: 2
            Row{
                spacing: 5
                Rectangle{
                    radius: 5
                    anchors.leftMargin: 5
                    width: content.width/4
                    height: content.height
                    Image {
                        source: model.modelData.image
                        width: parent.width
                        height: parent.height
                    }
                }
                Rectangle{
                    width: content.width/4*3
                    height: content.height
                    Column {
                        spacing: 8
                        id: column
                        anchors { fill: parent; margins: 2 }
                        Text {
                            text: model.modelData.name
                            font.pixelSize: 18
                            font.bold: true
                        }
                        Row{
                            Text { text:'☆ 4.3 ';font.pixelSize: 13}
                            Text { text: '月售' + '1234'+"              " ;font.pixelSize: 13}
                            Text { text: '30'+'分钟'+"  ";font.pixelSize: 13}
                            Text { text: '1.5'+'km';font.pixelSize: 13}
                        }
                        Rectangle{
                            width: parent.width/2
                            height: parent.height/4
                            color: "#ffff7f"
                            border.color: "#e6fde4"
                            Text {
                                anchors.centerIn: parent
                                text:model.modelData.info
                                font.bold: true
                                color: "#00ff53"
                                font.pixelSize: 13
                            }

                        }
                    }
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                   storePage.push("Test.qml",{businessName:model.modelData.name,businessInfo:model.modelData.info,businessImage:model.modelData.image})
                }
            }
        }
    }
    Component.onCompleted: {
        business.getblist()
    }
    ListView {
        id: view
        anchors { fill: parent; margins: 2 }
        delegate: dragDelegate
        spacing: 10
        cacheBuffer: 50
        onContentYChanged: {
            if(-contentY > 40){
                refreshFlag = true
            }
        }
        onMovementEnded: {
            if(refreshFlag){
                refreshFlag = false
                busy.running = true
            }
            business.getblist()
        }
    }
    Connections{
        target: business
        onSignalbList:{
            view.model=data;
        }
    }
}

