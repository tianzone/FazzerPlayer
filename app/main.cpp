//*****************************************************************************
// File Name:  main.cpp
// Copyright:  TIANZ, Inc. 2019. All rights reserved.
//*****************************************************************************

#include "FazzerPlayer.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    // TODO: What does it do?
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // TODO: What does it do?
    QGuiApplication app(argc, argv);

    // TODO: What does it do?
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    // TODO: What's happen?
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    // Instantiate the FazzerPlater and register the necessary objects into the qml context.
    FazzerPlayer player;
    player.RegisterObjectsToQml( engine );

    // TODO: What's happen?
    engine.load(url);

    // TODO: What does it do?
    return app.exec();
}
