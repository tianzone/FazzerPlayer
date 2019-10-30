//*****************************************************************************
// File Name:  main.qml
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 940
    height: 620
    title: qsTr("Fazzer player")

    Loader{
        id: id_audioModule

        anchors.fill: parent
        source: "qrc:/qml/audioModule/AudioModuleView.qml"
        visible: true
    }
}
