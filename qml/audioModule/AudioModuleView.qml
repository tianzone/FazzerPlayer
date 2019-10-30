//*****************************************************************************
// File Name:  AudioModuleView.qml
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "qrc:/qml/plugins"
import "qrc:/qml/audioModule/playControlBar"

Item{
    id: id_audioModuleView

    // Set the anchors
    anchors.fill: parent

    // The key control bar
    Row{
        id: id_keyControlBarRowLayout

        width: parent.width
        height: 100
        anchors{
            bottom: parent.bottom
            margins: 20
        }

        // The key set
        Rectangle{
            id: id_keySetRect

            width: parent.width / 4
            height: 50

            anchors{
                left: parent.left
                verticalCenter: parent.verticalCenter

            }
            border{
                color: "blue"
                width: 1
            }

            Row{
                id: id_keySetRowLayout

                anchors.fill: parent
                spacing: 10

                // The previous key
                ImageKey{
                    id: id_previousKey

                    anchors{
                        left: parent.left
                    }

                    text: qsTr( "P" )
                    onClicked: cpp_AudioModule.SetControlAction( "1" )
                }

                // The pause/continue key.
                ImageKey{
                    id: id_pauseAndContinueKey

                    // Record the last setting
                    property string lastSetting: "S"

                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }

                    text: qsTr( "S/C" )
                    onClicked: function(){
                        var showStr = ""
                        var setting = ""
                        if( lastSetting == "P" ){
                            lastSetting = "S"
                            setting = "3"
                            showStr = qsTr( "S" )

                            // Stop the counter.
                            id_audioPlayingTimer.stop()
                        }else{
                            lastSetting = "P"
                            setting = "4"
                            showStr = "P"

                            // Start the counter.
                            id_audioPlayingTimer.start()
                        }

                        cpp_AudioModule.SetControlAction( setting )
                        id_pauseAndContinueKey.text = showStr
                    }
                }

                // The next key.
                ImageKey{
                    id: id_nextKey

                    anchors{
                        right: parent.right
                    }

                    text: qsTr( "N" )
                    onClicked: cpp_AudioModule.SetControlAction( "5" )
                }
            }
        }

        // The progress bar of the current song.
        PlayProgressBar{
            id: id_playProgressBar

            width: parent.width / 2
            height: parent.height
            anchors{
                left: id_keySetRect.right
            }
        }

        // Tianz debug
        // Add a timer to update the time of the playing song.
        Timer{
            id: id_audioPlayingTimer

            // Update every second.
            interval: 1000
            repeat: true

            onTriggered: {
                id_playProgressBar.mProgressValue += 1
            }
        }
    }
}
