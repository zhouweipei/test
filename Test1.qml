import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    ToolBar {
        id:toolbar
        ToolButton {
            text: qsTr("‹")
            onClicked: storePage.pop()
        }
    }
    RowLayout {
        anchors.centerIn: parent
        width: parent.width
        Button {
            text: 'Page 1'
            Layout.fillWidth: true
            onClicked: {
                storePage.push(starting_page)
            }
        }
        Button {
            text: 'Page 2'
            Layout.fillWidth: true
            onClicked: {
                load_page(text);
            }
        }
        Button {
            text: 'Page 3'
            Layout.fillWidth: true
            onClicked: {
                load_page(text);
            }
        }
        Button {
            text: 'Page 4'
            Layout.fillWidth: true
            onClicked: {
                load_page(text);
            }
        }
    }
}
