//*****************************************************************************
// File Name:  AudioModule.h
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

#ifndef AUDIOMODULE_H
#define AUDIOMODULE_H

#include <QObject>

class QMessageLogger;

class AudioModule: public QObject
{
    Q_OBJECT
public:
    enum AudioPlayControlAction_e
    {
        AUDIO_PLAY_CONTROL_ACTION_UNKNOWN,
        AUDIO_PLAY_CONTROL_ACTION_PREVIOUS,
        AUDIO_PLAY_CONTROL_ACTION_REPLAY,
        AUDIO_PLAY_CONTROL_ACTION_PAUSE,
        AUDIO_PLAY_CONTROL_ACTION_CONTINUE,
        AUDIO_PLAY_CONTROL_ACTION_NEXT
    };

    explicit AudioModule( QObject* pParent = nullptr );
    virtual ~AudioModule();

    Q_INVOKABLE void SetControlAction( const QString& actionStr );

private:
    // How to get the loger in the whole project?
    QMessageLogger* m_pLog;
};

#endif
