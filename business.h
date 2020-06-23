//商家
#ifndef BUSINESS_H
#define BUSINESS_H

#include <QObject>
#include "database.h"
#include <qdebug.h>
class Business :public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name)
    Q_PROPERTY(QString password READ password)
    Q_PROPERTY(QString image READ image)
    Q_PROPERTY(QString info READ info)
//    Q_PROPERTY(QString d_image READ d_image)
//    Q_PROPERTY(QString dish_name READ dish_name)
//    Q_PROPERTY(QString d READ d_image)
public:
    Business(QObject *parent =nullptr);
    Business(const QString &name,const QString &image,const QString &info,QObject *parent=nullptr);
    QString name()const;
    QString password()const;
    QString image()const;
    QString info()const;
    Q_INVOKABLE void addBusiness(QString name,QString password,QString image, QString info);//添加商铺
    //void addcat(QString name);//创建菜单数据库
    //Q_INVOKABLE void setInfo(QString image,QString info);
    Q_INVOKABLE void addmenu(QString Bname,QString name,QString ingredients,QString price);//添加菜单
    Q_INVOKABLE bool login(QString name,QString password);//登录
    Q_INVOKABLE bool Signup(QString name);//是否注册
    Q_INVOKABLE QList<QObject*> getblist();//获取商家列表
signals:
    void signalbList(QList<QObject*> data);
private:
    QString business_name;//店铺名
    QString m_image;//商家图片
    QString brief_introduction;//简介
    QString d_image;//菜单图片
    Database businssopen;
    QSqlDatabase business_data,menudata;//商家数据  菜单
    QString business_password;
    QString dish_name;//菜名
    QString m_ingredients;//配料
    QString m_price;//价格
    QSqlDatabase menu_data;//菜单数据
    Database dbopen;
};

#endif // BUSINESS_H
