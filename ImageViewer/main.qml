import Qt.labs.platform 1.1
import QtQuick 2.9
import QtQuick.Controls 2.12

import QtQuick.Dialogs 1.3

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Image Viewer")

    background: Rectangle {
        color: "darkgray"
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    header: ToolBar {
        Flow {
            anchors.fill: parent
            ToolButton {
                text: qsTr("Open")
                icon.name: "document-open"
                onClicked: fileOpenDialog.open()
            }
        }
    }

    FileDialog {
        id: fileOpenDialog
        title: "Select an image file"
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        nameFilters: [
            "Image files *.png *.jpeg *.jpg"
        ]
        onAccepted: {
            image.source = fileOpenDialog.fileUrl
        }
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open...")
                icon.name: "document-open"
                onTriggered: fileOpenDialog.open()
            }
        }

        Menu {
            title: qsTr("&Help")
            MenuItem {
                text: qsTr("&About...")
                onTriggered: aboutDialog.open()
            }
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("&About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer")
            horizontalAlignment: Text.AlignHCenter
        }

        standardButtons: StandardButton.Ok
    }
}
