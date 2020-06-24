import QtQuick 2.0
import QtQuick.Controls 2.1
import Business 1.0
Rectangle {
    Business{
        id:business
    }
    Component {
        id: dragDelegate
        Rectangle {
            id: content
            anchors { left: parent.left; right: parent.right }
            height: column.implicitHeight +25
            Row{
                spacing: 5
                Rectangle{
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
                        Row{
                            Text { text: '起送￥ 15'+"  ";font.pixelSize: 12}
                            Text { text: '配送￥2'+"  " ;font.pixelSize: 12}
                            Text { text: '人均￥20' ;font.pixelSize: 12}
                        }
                    }
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{

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
    }
    Connections{
        target: business
        onSignalbList:{
            view.model=data;
        }
    }
}

