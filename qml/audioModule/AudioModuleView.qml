//*****************************************************************************
// File Name:  AudioModuleView.qml
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Item{
    id: id_audioModuleView

    // Set the anchors
    anchors.fill: parent

    // Add the properties.
    property string currentAction: "0"

    // Tianz debug
    Rectangle{
        id: id_testRect

        color: "green"

        width: 100
        height: 100

    }

    // Populate the control tool bar.
    RowLayout{
        id: id_audioModuleViewRowLayout
        anchors{
            left: parent.left
            horizontalCenter: parent.horizontalCenter
            fill: parent
        }

        Button{
            id: id_setPreviousButton
            width: parent.width / 6

            text: qsTr( "Previous" )

            onClicked: currentAction = "1"
        }
        Button{
            id: id_setReplayButton
            width: parent.width / 6

            text: qsTr( "Replay" )

            onClicked: currentAction = "2"
        }
        Button{
            id: id_setContinueOrPauseButton
            width: parent.width / 6

            text: qsTr( "C & P" )

            onClicked: {
                if( currentAction == "3" ){
                    currentAction = "4"
                }else{
                    currentAction = "3"
                }
            }

        }
        Button{
            id: id_setNextButton
            width: parent.width / 6

            text: qsTr( "Next" )

            onClicked: currentAction = "5"
        }

    }
    onCurrentActionChanged: cpp_AudioModule.SetControlAction( currentAction )
}
