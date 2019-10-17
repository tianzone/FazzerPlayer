
#include "AwesomeCounter.h"

#include <QDebug>
#include <QTimer>

static const unsigned int COUNTER_VALUE_MAXIMUM = 100;
static const qint32 MILISECOND_IN_ONE_SECOND = 1000;

AwesomeCounter::AwesomeCounter( QObject* pParent ):
    QObject( pParent ),
    m_Log( new QMessageLogger( QT_MESSAGELOG_FILE, QT_MESSAGELOG_LINE, QT_MESSAGELOG_FUNC ) ),
    m_pTimer( new QTimer( this ) ),
    m_CountInterval( 0 ),
    m_CurState( COUNTER_STATE_DISABLE )
{
    // Connet the timeout signal of timer to our slot.
    connect( m_pTimer, &QTimer::timeout, this, &AwesomeCounter::OnCounterChange );

    m_Log->info( "%s(): Initialize done...", __func__ );

    // Debug
    m_pTimer->setInterval( 2000 );
}

AwesomeCounter::~AwesomeCounter()
{
    delete m_Log;

    delete m_pTimer;
}

void AwesomeCounter::SetCounterState()
{
    // TODO: Add the lock right here.
    CounterState_e previousState = m_CurState;

    switch( previousState )
    {
        case COUNTER_STATE_ENABLE:
        {
            m_CurState = COUNTER_STATE_DISABLE;
            DisableCounter();
            break;
        }
        case COUNTER_STATE_DISABLE:
        {
            m_CurState = COUNTER_STATE_ENABLE;
            EnableCounter();
            break;
        }
        default:
        {
            break;
        }
    }
}

void AwesomeCounter::SetCounterInterval( qint32 seconds )
{
    // Validate the new value that whether is same as the one currently using.
    qint32 mSeconds = seconds * MILISECOND_IN_ONE_SECOND;
    if( m_pTimer->interval() == mSeconds )
    {
        m_Log->info( "%s(): The %u interval is realdy used.", __func__, seconds );
        return;
    }

    // Disable the counter firstly when apply a new interval.
    DisableCounter();

    m_pTimer->setInterval( mSeconds );
    m_Log->info( "%s(): Apply the new interval: %d", __func__, seconds );

    // Enable the counter
    EnableCounter();
}

void AwesomeCounter::OnCounterChange()
{
    if( m_CurCount > COUNTER_VALUE_MAXIMUM )
    {
        m_CurCount = 0;
    }

    // Print out the current count.
    m_Log->debug( "%s(): Cureent count: %u", __func__, m_CurCount );

    emit updateCountText( QString( "Cureent count: %0" ).arg( m_CurCount++ ) );
}

void AwesomeCounter::EnableCounter()
{
    m_Log->debug( "%s(): Enable the counter...", __func__ );

    m_pTimer->start();
}

void AwesomeCounter::DisableCounter()
{
    m_Log->debug( "%s(): Disable the counter...", __func__ );

    m_pTimer->stop();
}
