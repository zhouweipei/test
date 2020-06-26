#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "userdata.h"
#include "business.h"
#include "menu.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<Userdata>("Userdata",1,0,"Userdata");
    qmlRegisterType<Business>("Business",1,0,"Business");
    qmlRegisterType<Menu>("Menu",1,0,"Menu");
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
