
#include "app/AwesomeCounter.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    // TODO: Why set this arttibute?
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // TODO: Please going to further understand this class.
    QGuiApplication app(argc, argv);

    // TODO:: Invastigate the functions of the class.
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    // Instantiate the Counter
    AwesomeCounter counter( &app );

    // Inject the counter into the context of the Qml engine.
    engine.rootContext()->setContextProperty( "gAwesomeCounter", &counter );

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
