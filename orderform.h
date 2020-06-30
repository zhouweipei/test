#ifndef ORDERFORM_H
#define ORDERFORM_H
#include "database.h"
#include <QObject>
#include <QTime>
class Orderform:public QObject
{
    Q_OBJECT

public:
    Orderform(QObject *parent =nullptr);
    ~Orderform();
    Q_INVOKABLE void select_dish(QString Bname,QString name,int number,QString username,QString usertele,QString addr);
private:
    int num;
    QString dishName;
    int totalprice;
    QTime m_time;
    QString user_name;
    QString businessname;
    QString tel;
    QString user_address;
    QString pic;
    QSqlDatabase menu_data;
    Database menuopen;
};

#endif // ORDERFORM_H
