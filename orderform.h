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
    QTime m_time;

};

#endif // ORDERFORM_H
