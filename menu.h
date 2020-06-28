#ifndef MENU_H
#define MENU_H

#include <QObject>
#include "database.h"
class Menu :public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString image READ image)
    Q_PROPERTY(QString name READ name)
    Q_PROPERTY(QString ingredients READ ingredients)
    Q_PROPERTY(QString price READ price)
public:
    Menu(QObject *parent =nullptr);
    Menu(const QString &name,const QString &ingredients,const QString &price,const QString &image,QObject *parent=nullptr);
    QString name() const;
    QString ingredients() const;
    QString price() const;
    QString image() const;
    Q_INVOKABLE void addmenu(QString Bname,QString name,QString ingredients,QString price,QString image);//添加菜品
    Q_INVOKABLE void delete_menu(QString Bname,QString name);
    Q_INVOKABLE void increase_price(QString Bname,QString name,QString price);
    Q_INVOKABLE void decrease_price(QString Bname,QString name,QString price);
    Q_INVOKABLE QList<QObject*> getmlist(QString business_name);//获取菜单列表
signals:
    void signalmList(QList<QObject*> data);
private:
    Database menuopen;
    QString dish_name;//菜名
    QString m_ingredients;//配料
    QString m_price;//价格
    QString m_image;//图片
    QSqlDatabase menu_data;//菜单数据

};

#endif // MENU_H
