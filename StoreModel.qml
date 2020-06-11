/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
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

