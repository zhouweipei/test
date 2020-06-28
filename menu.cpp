#include "menu.h"

Menu::Menu(QObject *parent)
    :QObject(parent)
{

}
Menu::Menu(const QString &name,const QString &ingredients,const QString &price,const QString &image,QObject *parent)
    :QObject(parent),dish_name(name),m_ingredients(ingredients),m_price(price),m_image(image)
{

}

QString Menu::name() const
{
    return dish_name;
}
QString Menu::ingredients() const
{
    return m_ingredients;
}
QString Menu::price() const
{
    return m_price;
}
QString Menu::image() const
{
    return m_image;
}
void Menu::addmenu(QString Bname, QString name, QString ingredients, QString price, QString image)
{
    dish_name=name;
    m_price=price;
    m_ingredients=ingredients;
    m_image=image;
    QString menudata="Menu_Data_";
    menudata+=Bname;
    menudata+=".db";
    menu_data=menuopen.initDatabase(menudata);
    QSqlQuery query1(menu_data);
    query1.exec("create table menu(dish_name varchar(20),ingredients varchar(50),price varchar(10),image varchar(50))");
    query1.prepare("insert into menu (dish_name,ingredients,price,image) values(?,?,?,?)");
    query1.addBindValue(dish_name);
    query1.addBindValue(m_ingredients);
    query1.addBindValue(m_price);
    query1.addBindValue(m_image);
    query1.exec();
}
QList<QObject*> Menu::getmlist(QString business_name)
{
    QList<QObject*> menuList;
    QString menudata="Menu_Data_";
    menudata+=business_name;
    menudata+=".db";
    menu_data=menuopen.initDatabase(menudata);
    QSqlQuery query(menu_data);
    query.exec("select * from menu");
    while (query.next()) {
        QObject *data=new Menu(query.value(0).toString(),query.value(1).toString(),query.value(2).toString(),query.value(3).toString());
        menuList.append(data);
    }
    query.exec();
    emit signalmList(menuList);
    return menuList;
}
void Menu::delete_menu(QString Bname, QString name)
{
    QString menudata="Menu_Data_";
    menudata+=Bname;
    menudata+=".db";
    menu_data=menuopen.initDatabase(menudata);
    QSqlQuery query(menu_data);
    QString del="delete from menu where dish_name='";
    del+=name;
    del+="'";
    query.exec(del);
    getmlist(Bname);
}
void Menu::increase_price(QString Bname,QString name, QString price)
{
    double intprice=price.toDouble();
    intprice+=0.5;
    QString new_price=QString::number(intprice);
    QString menudata="Menu_Data_";
    menudata+=Bname;
    menudata+=".db";
    menu_data=menuopen.initDatabase(menudata);
    QString change="update menu set price='";
    change+=new_price;
    change+="' where dish_name='";
    change+=name;
    change+="'";
    qDebug()<<change;
    QSqlQuery query(menu_data);
    query.exec(change);
    getmlist(Bname);
}
void Menu::decrease_price(QString Bname, QString name, QString price)
{
    double intprice=price.toDouble();
    //qDebug()<<intprice;
    intprice-=0.5;
   // qDebug()<<intprice;
    QString new_price=QString::number(intprice);
    QString menudata="Menu_Data_";
    menudata+=Bname;
    menudata+=".db";
    menu_data=menuopen.initDatabase(menudata);
    QString change="update menu set price='";
    change+=new_price;
    change+="' where dish_name='";
    change+=name;
    change+="'";
    qDebug()<<change;
    QSqlQuery query(menu_data);
    query.exec(change);
    getmlist(Bname);
}
