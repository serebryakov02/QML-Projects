import QtQuick 2.15

Item {
    id: root

    width: image.width
    height: image.height

    property alias source: image.source

    signal clicked

    Image {
        id: image

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
