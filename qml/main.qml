import QtQuick 2.12
import QtQuick.Window 2.12

import QtQuick.Controls 2.12

// import the layout modules
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr( "Fazzer Player" )

    ColumnLayout{
        id: mainViewColumnLayout
        anchors.fill: parent

        TextField{
            id: textArea
//            anchors.fill: parent

            // Set the width and the height
            width: parent.width
            height: 300

            // Set the visible
            visible: true

            // Set the text area to read only.
            readOnly: true


            text: qsTr( "Hello, I'm FazzerCounter!" )
        }

        RowLayout{
            id: stateLableAndButtonRowLayout
//            anchors.centerIn: textArea.bottom

            visible: true

            Label{
                id: counterStateLabel
//                anchors.top: textArea.bottom
                visible: true

                text: qsTr( "Turn on/off" )
            }

            Button{
                id: counterStateButton
//                anchors.top: textArea.bottom
//                anchors.left: counterStateLabel.right

                text: qsTr( "Switch" )

                onClicked: gAwesomeCounter.SetCounterState()
            }
        }

        RowLayout{
            id: setIntervalRowLayout
//            BorderImage {
//                id: name
//                source: "qrc:/images/Background.bmp"
//                width: 100; height: 100
//                border.left: 5; border.top: 5
//                border.right: 5; border.bottom: 5
//            }

            Label{
                id: setIntervalLabel

                // TODO: Set the font( color and size )

                text: qsTr( "Interval: " )
            }

            SpinBox{
                id: intervalSpinBox

                // Set the maximum value and minimum value for it.

            }

            Button{
                id: intervalApplyButton

                text: "Apply"

                onClicked: function(){
                    var newInterval = intervalSpinBox.value

                    // Notify the C++ side
                    gAwesomeCounter.SetCounterInterval( newInterval )
                }
            }
        }
    }

    Connections{
        target: gAwesomeCounter
        onUpdateCountText: function( data ){
            textArea.text = data
        }
    }
}
