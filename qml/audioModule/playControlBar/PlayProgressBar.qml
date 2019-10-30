//*****************************************************************************
// File Name:  PlayProgressBar.qml
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Item{
//    anchors.fill: parent

    // Public the mProgressValue to allow another access/update the current progress.
    property int mProgressValue: 0

    // Convert the time in seconds to the mm.ss format
    function updateProgressTime( value ){
        var minute = Number( value / 60 ) % 60
        var second = value % 60

        // Tianz debug.
        console.debug( "Update: " + value + ", minute: " + minute + ", second: " + second )

        id_counterRect.mText = String( minute ) + "." + String( second )
    }

    // Update the progress text once the progress value is modified.
    onMProgressValueChanged: {
        updateProgressTime( mProgressValue )

        // Update the value of the slider as well.
        id_progressSlider.value = mProgressValue
    }

    // [1 / 3] The counter text of the currently song playing.
    Rectangle{
        id: id_counterRect

        // The text.
        property alias mText: id_counterText.text

        width: 40
        height: 10
        anchors{
            left: parent.left
            leftMargin: 5
            verticalCenter: parent.verticalCenter
        }
        border{
            color: "gray"
            width: 1
        }
        Text {
            id: id_counterText

            anchors.centerIn: parent
            text: qsTr("00.00.00")
        }
    }

    // [2 / 3] The real progress slider
    Slider{
        id: id_progressSlider

        width: 400
        anchors{
            left: id_counterRect.right
            verticalCenter: parent.verticalCenter
        }
        from: 0
        to: 600

        // Set the step size to 500ms.
        stepSize: 0.5
        onValueChanged: {
            console.debug( "The current progress: " + id_progressSlider.value )
        }
    }

    // [3 / 3] The total time of the current song.
    Text{
        id: id_totalTime

        width: 20
        anchors{
            left: id_progressSlider.right
            verticalCenter: parent.verticalCenter
        }
        text: qsTr( "3.25.0" )
    }
}
