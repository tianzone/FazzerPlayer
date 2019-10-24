//*****************************************************************************
// File Name:  AudioModule.h
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

#include "AudioModule.h"

#include <QMessageLogger>

AudioModule::AudioModule( QObject* pParent ):
    QObject( pParent ),
    m_pLog( new QMessageLogger(QT_MESSAGELOG_FILE, QT_MESSAGELOG_LINE, QT_MESSAGELOG_FUNC) )
{
    m_pLog->info( "%s(): Initialize done...", __func__ );
}

AudioModule::~AudioModule()
{
    delete m_pLog;
}

void AudioModule::SetControlAction( const QString& actionStr )
{
    AudioPlayControlAction_e newAction = static_cast<AudioPlayControlAction_e>( actionStr.toUInt() );

    if( newAction == AUDIO_PLAY_CONTROL_ACTION_UNKNOWN )
    {
        m_pLog->debug( "%s(): Unknown action was set. Did nothing.", __func__ );
        return;
    }

    QString promptStr = "Nothing has happened";

    switch( newAction )
    {
    case AUDIO_PLAY_CONTROL_ACTION_PREVIOUS:
    {
        promptStr = "switch to the previous song";
        break;
    }
    case AUDIO_PLAY_CONTROL_ACTION_REPLAY:
    {
        promptStr = "replay the song";
        break;
    }
    case AUDIO_PLAY_CONTROL_ACTION_PAUSE:
    {
        promptStr = "pause the current playing";
        break;
    }
    case AUDIO_PLAY_CONTROL_ACTION_CONTINUE:
    {
        promptStr = "continue play the song";
        break;
    }
    case AUDIO_PLAY_CONTROL_ACTION_NEXT:
    {
        promptStr = "switch to the next song";
        break;
    }
    default:
    {
        break;
    }
    }

    m_pLog->debug( "%s(): The ( %s ) was set", __func__, promptStr.toStdString().c_str() );
}
