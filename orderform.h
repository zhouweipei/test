#ifndef ORDERFORM_H
#define ORDERFORM_H

#include <QObject>
#include <QTime>
class Orderform:public QObject
{
    Q_OBJECT
public:
    Orderform(QObject *parent =nullptr);
    ~Orderform();

private:
    int num;
    QString dishName;
    int totalprice;
    QTime m_time;
    QString username;
    QString businessname;

};

#endif // ORDERFORM_H
