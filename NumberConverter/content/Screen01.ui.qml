/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import NumberConverter

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Column {
        id: column
        width: 200
        height: 180
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter

        Grid {
            id: grid
            width: 400
            height: 130
            spacing: 10
            rows: 3
            columns: 2

            Label {
                id: label
                text: qsTr("Type:")
            }

            ComboBox {
                id: comboBox
                model: ListModel {
                    id: model
                    ListElement { text: "Inches to feet" }
                    ListElement { text: "Feet to inches" }
                }
            }

            Label {
                id: label1
                text: qsTr("From:")
            }

            TextField {
                id: textField
                placeholderText: qsTr("Text Field")
            }

            Label {
                id: label2
                text: qsTr("Result:")
            }

            Label {
                id: lblResult
                text: qsTr("Nothing")
                font.pointSize: 20
                font.bold: true
            }


        }

        Button {
            id: btnConvert
            text: qsTr("Convert")
            anchors.horizontalCenter: parent.horizontalCenter

            Connections {
                target: btnConvert
                onClicked: {
                    var value = textField.text
                    var ret = 0
                    switch (comboBox.currentIndex) {
                    case 0: // Inches to feet
                        ret = value / 12
                        break;
                    case 1: // Feet to inches
                        ret = value * 12
                        break;
                    }
                    lblResult.text = ret
                }
            }
        }
    }
}
