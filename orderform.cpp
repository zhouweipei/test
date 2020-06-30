#include "orderform.h"

Orderform::Orderform(QObject *parent)
    :QObject(parent)
{

}
Orderform::~Orderform()
{}

void Orderform::select_dish(QString Bname, QString name, int number, QString username, QString usertele, QString addr)
{
    businessname=Bname;
    dishName=name;
   num =number;
    user_name=username;
    user_address=addr;
    usertele=tel;
    QString menudata="Menu_Data_";
    menudata+=Bname;
    menudata+=".db";
    menu_data=menuopen.initDatabase(menudata);
    QSqlQuery query(menu_data);
    query.exec("select *from menu");
    while(query.next())
    {
        if(dishName==query.value(0).toString())
        {
            pic=query.value(3).toString();

        }
    }
}



