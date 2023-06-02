import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: rect.width
    height: rect.height
    visible: true
    title: qsTr("Traffic Light")

    Rectangle {
        id: rect
        width: 150; height: 250
        color: "gray"

        Rectangle {
            id: light1
            x: 25; y: 15
            width: 100; height: width
            radius: width / 2
            color: "black"
            border.color: "darkgray"
        }

        Rectangle {
            id: light2
            x: 25; y: 135
            width: 100; height: width
            radius: width / 2
            color: "black"
            border.color: "darkgray"
        }

        state: "stop"

        states: [
            State {
                name: "stop"
                PropertyChanges { target: light1; color: "red"; }
                PropertyChanges { target: light2; color: "black"; }
            },

            State {
                name: "start"
                PropertyChanges { target: light1; color: "black"; }
                PropertyChanges { target: light2; color: "green"; }
            }
        ]

        transitions: [
            Transition {
                from: "stop"
                to: "start"

                ColorAnimation {
                    target: light1
                    from: "red"
                    to: "black"
                    duration: 1500
                }

                ColorAnimation {
                    target: light2
                    from: "black"
                    to: "green"
                    duration: 1500
                }

                SequentialAnimation {
                    ColorAnimation {
                        target: light1
                        from: "red"
                        to: "black"
                        duration: 1000
                    }

                    ColorAnimation {
                        target: light2
                        from: "black"
                        to: "yellow"
                        duration: 1000
                    }
                }

            }
        ]

        MouseArea {
            anchors.fill: parent
            onClicked: parent.state = (parent.state == "stop" ? "start" : "stop")
        }
    }
}
