import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: background.width
    height: background.height
    visible: true
    title: qsTr("Wind Mill")

    Image {
        id: background
        source: "qrc:/images/background.png"

        Image {
            id: pole
            source: "qrc:/images/pole.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }

        Image {
            id: pinwheel
            source: "qrc:/images/pinwheel.png"
            anchors.centerIn: parent

            Behavior on rotation {
                NumberAnimation {
                    duration: 250
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: pinwheel.rotation += 90
        }
    }
}
