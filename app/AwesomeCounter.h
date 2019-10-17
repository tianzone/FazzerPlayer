#ifndef AWESOMECOUNTER_H
#define AWESOMECOUNTER_H

#include <QObject>

class QTimer;

class AwesomeCounter: public QObject
{
    Q_OBJECT
public:
    enum CounterState_e
    {
        COUNTER_STATE_UNKNOWN,
        COUNTER_STATE_ENABLE,
        COUNTER_STATE_DISABLE
    };

    explicit AwesomeCounter( QObject* pParent = nullptr );
    virtual ~AwesomeCounter();

    Q_INVOKABLE void SetCounterState();
    Q_INVOKABLE void SetCounterInterval( qint32 newVal );

    void OnCounterChange();

signals:
        void updateCountText( QString text );

private:
    void EnableCounter();
    void DisableCounter();

    QMessageLogger* m_Log;

    QTimer* m_pTimer;

    unsigned int m_CountInterval;
    CounterState_e m_CurState;
    unsigned int m_CurCount;
};

#endif // AWESOMECOUNTER_H
