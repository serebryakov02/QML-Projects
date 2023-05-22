/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import SquareFootageCalculator

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Column {
        id: column
        width: 200
        height: 134
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Label {
            id: label
            text: qsTr("0 sqft")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 25
        }

        Grid {
            id: grid
            width: 400
            height: 400
            spacing: 10
            rows: 2
            columns: 2

            Label {
                id: lblWidth
                text: qsTr("Width")
            }

            SpinBox {
                id: spinBoxWidth

                Connections {
                    target: spinBoxWidth
                    onValueModified:
                        label.text = spinBoxWidth.value * spinBoxHeight.value + " sqft"
                }
            }

            Label {
                id: lblHeight
                text: qsTr("Height")
            }

            SpinBox {
                id: spinBoxHeight

                Connections {
                    target: spinBoxHeight
                    onValueModified:
                        label.text = spinBoxWidth.value * spinBoxHeight.value + " sqft"
                }
            }

        }
    }
}
