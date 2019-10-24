//*****************************************************************************
// File Name:  AudioModuleView.qml
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "qrc:/qml/plugins"

// Tianz debug
//import QtWebKit 3.0


Item{
    id: id_audioModuleView

    // Set the anchors
    anchors.fill: parent

    // Add the properties.
    property string currentAction: "0"

    // Set the opacity
    opacity: 1

    // Tianz debug
    // The web view.
//    WebView{
//        id: id_webView

//        width: parent.width

//        anchors{
//            top: parent.top
//            bottom: id_keyControlBarRowLayout.top
//            bottomMargin: 20
//        }

//        url: "www.baidu.com"
//    }

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
                width: 2
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
                    property string lastSetting: "P"

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
                        }else{
                            lastSetting = "P"
                            setting = "4"
                            showStr = "P"
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
        Slider{
            id: id_sliderOfSong

            width: parent.width / 2

            anchors{
                left: id_keySetRect.right
                verticalCenter: parent.verticalCenter
            }

            from: 0
            to: 100

            onValueChanged: function(){
                console.debug( "value:" + id_sliderOfSong.value )
            }
        }
    }
}
