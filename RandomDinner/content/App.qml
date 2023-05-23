// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0

import QtQuick 6.2
import RandomDinner
import QtQuick.Controls 6.3

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "RandomDinner"

    Screen01 {
        id: mainScreen
    }

    property variant places: ["Italian", "Mexican", "American", "Asian", "Ukrainian"]

    MouseArea {
        id: area
        anchors.fill: parent

        onClicked: {
            aniStart.stop()
            aniFateOut.stop()
            lblPlace.font.pixelSize = 45
            lblPlace.opacity = 0
            lblPlace.rotation = 0.0
            aniFateOut.start()
        }

        Label {
            id: lblPlace
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: 25
            text: "Tap me"
        }
    }

    function pick() {
        var i = Math.floor(Math.random() * places.length)
        lblPlace.text = places[i]
        aniSelection.start()
    }

    SequentialAnimation {
        id: aniStart
        running: true
        loops: Animation.Infinite

        NumberAnimation { target: lblPlace; property: "font.pixelSize"; to: 45; duration: 1000 }
        NumberAnimation { target: lblPlace; property: "font.pixelSize"; to: 25; duration: 1000 }
    }

    OpacityAnimator {
        id: aniFateOut
        target: lblPlace;
        from: 1;
        to: 0;
        duration: 1000
        running: false
        onFinished: pick()
    }

    ParallelAnimation {
        id: aniSelection
        running: false

        NumberAnimation {
            target: lblPlace;
            property: "font.pixelSize"
            from: 0;
            to: 45;
            duration: 2000
        }

        OpacityAnimator {
            target: lblPlace;
            from: 0;
            to: 1;
            duration: 2000
        }

        RotationAnimation {
            target: lblPlace;
            from: 0
            to: 1
            duration: 2000
            direction: RotationAnimation.Counterclockwise
        }
    }
}

