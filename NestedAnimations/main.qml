import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root

    width: rect.width
    height: rect.height
    visible: true
    title: qsTr("Nested Animations")

    property int duration: 3000

    Rectangle {
        id: rect
        width: 480
        height: 300

        Rectangle {
            id: sky
            width: parent.width
            height: 200
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#0080FF" }
                GradientStop { position: 1.0; color: "#66CCFF" }
            }
        }

        Rectangle {
            id: ground
            width: parent.width
            anchors.top: sky.bottom
            anchors.bottom: rect.bottom
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#00FF00" }
                GradientStop { position: 1.0; color: "#00803F" }
            }
        }

        Image {
            id: ball
            source: "qrc:/images/football.png"
            x: 0
            y: rect.height - height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ball.x = 0
                    ball.y = parent.height - ball.height
                    ball.rotation = 0
                    anim.restart()
                }
            }

            ParallelAnimation {
                id: anim
                SequentialAnimation {
                    NumberAnimation {
                        target: ball
                        properties: "y"
                        duration: root.duration * 0.4
                        to: 20
                        easing.type: Easing.OutCirc
                    }

                    NumberAnimation {
                        target: ball
                        properties: "y"
                        duration: root.duration * 0.6
                        to: 240
                        easing.type: Easing.OutBounce
                    }
                }

                NumberAnimation {
                    target: ball
                    properties: "x"
                    duration: root.duration
                    to: 400
                }

                RotationAnimation {
                    target: ball
                    properties: "rotation"
                    duration: root.duration
                    to: 720
                }
            }
        }
    }
}
