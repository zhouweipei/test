#include "database.h"
#include <QSqlQuery>
Database::Database()//注意多数据库的打开方式
{
    if(QSqlDatabase::contains("qt_sql_default_connection"))
        db = QSqlDatabase::database("qt_sql_default_connection");
    else
        db=QSqlDatabase::addDatabase("QSQLITE");

}
QSqlDatabase Database::initDatabase(QString name)
{

    db.setDatabaseName(name);

    if(!db.open())
    {
        qDebug()<<"文件打开错误，请重新尝试。";
    }
    return db;
}

void Database::closedb()
{
    db.close();
}
