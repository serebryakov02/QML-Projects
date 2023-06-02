import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Sequential Animation")

    property int duration: 3000

    ClickableImageV3 {
        id: ufo
        source: "qrc:/images/ufo.png"
        x: 0
        y: parent.height - height
        onClicked: ani.start()
    }

    SequentialAnimation {
        id: ani

        NumberAnimation {
            target: ufo
            property: "x"
            duration: root.duration * 0.6
            to: (root.width - ufo.width) / 2
        }

        NumberAnimation {
            target: ufo
            property: "y"
            duration: root.duration * 0.4
            to: 0
        }
    }
}
