#include "userdata.h"
#include "iostream"
Userdata::Userdata(QObject *parent)
    :QObject(parent)
{
    
}
Userdata::~Userdata()
{

    
}
QString Userdata::username() const
{
    return m_username;
}
void Userdata::setUsername(const QString username)
{
    if (m_username!=username)
        m_username=username;
}
QString Userdata::address() const
{
    return m_address;
}
void Userdata::setAddress(const QString address)
{
    if(m_address!=address)
        m_address=address;
}
QString Userdata::telenum() const
{
    return m_telenum;
}
void Userdata::setTelenum(const QString telenum)
{
    if(m_telenum!=telenum)
        m_telenum=telenum;
}
QString Userdata::password() const
{
    return m_password;
}
void Userdata::setPassword(const QString password)
{
    if(m_password!=password)
        m_password=password;
}
void Userdata::registInfo(QString username, QString telenum, QString password)
{
    m_username=username;
    m_password=password;
    m_telenum=telenum;

    user_registdata=registopen.initDatabase("userregist_data.db");
    QSqlQuery registquery(user_registdata);
    registquery.exec("create table student (username varchar(20) primary key,password varchar(20),telenum varchar(20))");
    registquery.prepare("insert into student(username ,password,telenum) values(?,?,?)");
    registquery.addBindValue(m_username);
    registquery.addBindValue(m_password);
    registquery.addBindValue(m_telenum);
    registquery.exec();

//    registquery.exec("select * from student");
//    while (registquery.next()) {
//        qDebug()<<registquery.value(0).toString()<<registquery.value(1).toString()<<registquery.value(2).toString();
//    }

}
bool Userdata::compare_usermessage(QString username)
{
    user_registdata=registopen.initDatabase("userregist_data.db");
    QSqlQuery usermessage(user_registdata);
    usermessage.exec("select * from student");
    while (usermessage.next())
    {
        qDebug()<<usermessage.value(0).toString()<<username;
        if(usermessage.value(0).toString()==(username))
        {

            return true;
           // qDebug()<<m_username<<m_telenum<<m_password;
            break;
        }

    }
    return false;
}
bool Userdata::compare_login(QString username,QString telenum, QString password)
{
    user_registdata=registopen.initDatabase("userregist_data.db");
    QSqlQuery usermessage(user_registdata);
    usermessage.exec("select * from student");
    while (usermessage.next())
    {

       // qDebug()<<usermessage.value(0).toString()<<username;
        if(usermessage.value(0).toString()==username&&usermessage.value(1).toString()==password&&usermessage.value(2).toString()==telenum)
        {
            m_username=usermessage.value(0).toString();
            m_password=usermessage.value(1).toString();
            m_telenum=usermessage.value(2).toString();
            return true;

            break;
        }

    }
    return false;
}
bool Userdata::islogin()
{
    if(m_telenum!=NULL&&m_password!=NULL)
    {
        return true;
    }else{
        return false;
    }
}
bool Userdata::isSignup(QString username)
{
    user_registdata=registopen.initDatabase("userregist_data.db");
    QSqlQuery usermessage(user_registdata);
    usermessage.exec("select * from student");
    while (usermessage.next())
    {


        if(usermessage.value(0).toString()==username)
        {

            return true;

            break;
        }

    }
    return false;
}
