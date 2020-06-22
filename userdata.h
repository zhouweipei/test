#ifndef USERDATA_H
#define USERDATA_H
#include <QObject>
#include <QString>
#include <QSqlDatabase>
#include <qdebug.h>
#include "database.h"
class Userdata :public QObject
{
    Q_OBJECT
public:
    Userdata(QObject *parent =nullptr);
    ~Userdata();
    Q_PROPERTY(QString username READ username WRITE setUsername)
    Q_PROPERTY(QString telenum READ telenum WRITE setTelenum)
    Q_PROPERTY(QString password READ password WRITE setPassword)
    Q_PROPERTY(QString address READ address WRITE setAddress)
    QString username() const;
    void setUsername(const QString username);
    QString telenum() const;
    void setTelenum(const QString telenum);
    QString password() const;
    void setPassword(const QString password);
    QString address() const;
    void setAddress(const QString address);
    Q_INVOKABLE void registInfo(QString username,QString telenum,QString password);
    Q_INVOKABLE bool compare_login(QString username, QString telenum ,QString password);
    Q_INVOKABLE bool isSignup(QString username);
    Q_INVOKABLE void change_password(QString telenum,QString newpassword);

private:
    Database registopen;
    QSqlDatabase user_registdata;
    QString m_username;
    QString m_telenum;
    QString m_password;
    QString m_address;
    bool isLogin=false;




};
#endif // USERDATA_H
