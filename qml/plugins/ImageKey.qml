//*****************************************************************************
// File Name:  ImageKey.qml
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Rectangle{
    id: id_rect

    // Alias the property of the text of Text.
    property alias text: id_textOfkey.text

    // Alias the property of the callback function of onClicked.
    signal clicked()

    width: 30
    height: 30
    anchors{
        //left: parent.left
        margins: 10
        verticalCenter: parent.verticalCenter
    }
    radius: 100
    border{
        color: "green"
        width: 1
    }

    Text {
        id: id_textOfkey
        //text: qsTr( "P" )
        anchors{
            centerIn: parent
        }
    }

    MouseArea{
        id: id_keyMouseArea

        anchors.fill: parent

        onClicked: {
            id_rect.clicked()
        }
    }
}
