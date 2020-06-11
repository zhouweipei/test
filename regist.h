#ifndef REGIST_H
#define REGIST_H
#include <database.h>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QObject>

class Regist:public QObject
{
    Q_OBJECT
public:
    Regist(QObject *parent=nullptr);
    ~Regist();
private:
    Database registinfo;
    QSqlDatabase user_registdata,userdata;
};
#endif // REGIST_H
