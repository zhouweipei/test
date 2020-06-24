#include "business.h"

Business::Business(QObject *parent)
    :QObject(parent)
{

}
Business::Business(const QString &name, const QString &image, const QString &info , QObject *parent)
    :QObject(parent),business_name(name),m_image(image),brief_introduction(info)
{

}
//添加商铺
QString Business::name() const
{
    return business_name;
}
QString Business::image() const
{
    return m_image;
}
QString Business::info() const
{
    return brief_introduction;
}

void Business::addBusiness(QString name,QString image, QString info)
{
    business_name=name;
    m_image=image;
    brief_introduction=info;
    business_data=businssopen.initDatabase("business_data.db");
    QSqlQuery add_businessquery(business_data);
    add_businessquery.exec("create table businessdata (businessname varchar(20) ,business_info varchar(50),business_image varchar(50))");
    add_businessquery.prepare("insert into businessdata (businessname,business_info,business_image) values(?,?,?)");
    add_businessquery.addBindValue(business_name);
    add_businessquery.addBindValue(brief_introduction);
    add_businessquery.addBindValue(m_image);
    add_businessquery.exec();
}
//登录
bool Business::login(QString name, QString password)
{
    business_data=businssopen.initDatabase("business_data.db");
    QSqlQuery businessdata(business_data);
    businessdata.exec("select *from business_data");
    while (businessdata.next()) {
        if(businessdata.value(0).toString()==name&&businessdata.value(1).toString()==password)
        {
            business_name=businessdata.value(0).toString();
           // business_password=businessdata.value(1).toString();
            brief_introduction=businessdata.value(2).toString();
            m_image=businessdata.value(3).toString();
            return  true;
            break;
        }
    }
    return false;
}
//是否注册
bool Business::Signup(QString name)
{
    business_data=businssopen.initDatabase("business_data.db");
    QSqlQuery businessdata(business_data);
    businessdata.exec("select *from business_data");
    while (businessdata.next()) {
        if(businessdata.value(0).toString()==name)
        {

            return  true;
            break;
        }
    }
    return false;
}
void Business::remove(QString name)
{
    QString del="delete from businessdata where businessname ='";
    del+=name;
    del+="'";
    business_data=businssopen.initDatabase("business_data.db");
    QSqlQuery query(business_data);
    query.exec(del);
    qDebug()<<del;
}
void Business::addmenu(QString Bname ,QString name, QString ingredients, QString price)
{
    dish_name=name;
    m_price=price;
    m_ingredients=ingredients;
    QString menu_data="Menu_Data_";  
    menu_data+=Bname;
    menu_data+=".db";
    menudata=dbopen.initDatabase(menu_data);
    QSqlQuery query1(menudata);
    query1.exec("create table menu(dish_name varchar(20),ingredients varchar(50),price varchar(10))");
    query1.prepare("insert into menu (dish_name,ingredients,price) values(?,?,?)");
    query1.addBindValue(dish_name);
    query1.addBindValue(m_ingredients);
    query1.addBindValue(m_price);
    qDebug()<<dish_name<<m_ingredients<<m_price;
    query1.exec();
}
QList<QObject*> Business::getblist()
{
    QList<QObject*> businessList;
    business_data=businssopen.initDatabase("business_data.db");
    QSqlQuery businessdata(business_data);
    businessdata.exec("select *from businessdata");
    while (businessdata.next()) {
       business_name=businessdata.value(0).toString();
       brief_introduction=businessdata.value(2).toString();
       m_image=businessdata.value(3).toString();
       QObject* data=new Business(business_name,m_image,brief_introduction);
       businessList.append(data);
       qDebug()<<business_name<<brief_introduction<<m_image;
    }
    businessdata.exec();
    emit signalbList(businessList);
    return businessList;
}
