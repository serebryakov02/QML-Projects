import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 600
    height: 400
    visible: true
    title: qsTr("Parallel Animation")

    color: "lightgray"

    property int duration: 3000

    ClickableImageV3 {
        id: ufo
        x: 0; y: root.height - height
        source: "qrc:/images/ufo.png"
        onClicked: anim.start()
    }

    ParallelAnimation {
        id: anim

        NumberAnimation {
            target: ufo
            property: "x"
            duration: root.duration
            to: root.width - ufo.width
        }

        NumberAnimation {
            target: ufo
            property: "y"
            duration: root.duration
            to: 0
        }
    }
}
