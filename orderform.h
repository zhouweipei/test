#ifndef ORDERFORM_H
#define ORDERFORM_H
#include <QString>
#include <QObject>
class Orderform:public QObject
{
    Q_OBJECT
public:
    Orderform(QObject *parent =nullptr);
    ~Orderform();

private:
    QString
};

#endif // ORDERFORM_H
