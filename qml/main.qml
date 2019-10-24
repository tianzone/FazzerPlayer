//*****************************************************************************
// File Name:  main.qml
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

import QtQuick 2.12
import QtQuick.Window 2.12

// Import the enum from the C++ side.
import audioModule.cpp 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Fazzer player")

    Loader{
        id: id_audioModule

        anchors.fill: parent

        source: "qrc:/qml/audioModule/AudioModuleView.qml"

        visible: true
    }
}
