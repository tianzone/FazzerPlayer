//*****************************************************************************
// File Name:  FazzerPlayer.cpp
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

#include "FazzerPlayer.h"

#include <QQmlContext>

FazzerPlayer::FazzerPlayer()
{

}

FazzerPlayer::~FazzerPlayer()
{

}

void FazzerPlayer::RegisterObjectsToQml( QQmlApplicationEngine& engine )
{
    // Set the AudioModule into the context of the qml app.
    engine.rootContext()->setContextProperty( "cpp_AudioModule", &m_AudioModule );

    // Register the AudioPlayControlAction_e enum of AudioModule
//    qmlRegisterType<AudioModule::AudioPlayControlAction_e>( "AudioModule.AudioPlayControlAction_e", 1, 0, "AudioPlayControlAction_e" );

    // Register the AudioModule type into the context of qml.
    qmlRegisterType<AudioModule>( "audioModule.cpp", 1, 0, "AudioModule" );
}
