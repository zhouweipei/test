import QtQuick 2.0

import QtQuick.Controls 2.1



Rectangle {

    id: frmWindow

    property alias listModel: listModel



    ListModel{

        id:listModel



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

                        source: srcImage

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

                            text: storeName

                            font.pixelSize: 18

                            font.bold: true

                        }

                        Row{

                            Text { text:'☆'+score+' ';font.pixelSize: 13}

                            Text { text: '月售' + monthlySales+"              " ;font.pixelSize: 13}

                            Text { text: time+'分钟'+"  ";font.pixelSize: 13}

                            Text { text: distance+'km';font.pixelSize: 13}

                        }

                        Row{

                            Text { text: '起送￥' + money+"  ";font.pixelSize: 12}

                            Text { text: '配送￥' + istribution+"  " ;font.pixelSize: 12}

                            Text { text: '人均￥'+perCapita ;font.pixelSize: 12}

                        }

                    }

                }

            }

            MouseArea{

                anchors.fill: parent

                onClicked:{

                    storePage.push(url)

                }

            }

        }

    }

    ListView {

        id: view

        anchors { fill: parent; margins: 2 }

        model:StoreList{}

        delegate: dragDelegate

        spacing: 10

        cacheBuffer: 50

    }



}

