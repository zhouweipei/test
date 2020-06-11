#ifndef DATABASE_H
#define DATABASE_H
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QString>
#include <qdebug.h>
class Database
{
public:
    Database();
    QSqlDatabase db;
    QSqlDatabase initDatabase(QString name);
    void closedb();
};

#endif // DATABASE_H
