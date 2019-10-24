//*****************************************************************************
// File Name:  FazzerPlayer.h
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

#ifndef FAZZERPLAYER_H
#define FAZZERPLAYER_H

#include "audioModule/AudioModule.h"

#include <QQmlApplicationEngine>

class FazzerPlayer
{
public:
    FazzerPlayer();
    ~FazzerPlayer();

    void RegisterObjectsToQml( QQmlApplicationEngine& engine );

private:
    AudioModule m_AudioModule;
};

#endif // FAZZERPLAYER_H
