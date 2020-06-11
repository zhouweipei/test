#ifndef USERDATA_H
#define USERDATA_H
#include <QObject>
#include <QString>
#include <database.h>
#include <QSqlDatabase>
#include <qdebug.h>
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
    Q_INVOKABLE bool compare_usermessage(QString username);
    Q_INVOKABLE bool compare_login(QString username, QString telenum ,QString password);
    Q_INVOKABLE bool isSignup(QString username);
    Q_INVOKABLE bool islogin();

private:
    Database dbopen;
    Database registopen;
    QSqlDatabase userdata,user_registdata;
    QString m_username;
    QString m_telenum;
    QString m_password;
    QString m_address;




};
#endif // USERDATA_H
