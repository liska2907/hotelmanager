#ifndef SQLCONTROLLER_H
#define SQLCONTROLLER_H
#include <QSqlDatabase>
#include <iostream>
#include <QSqlQuery>
#include <QString>
#include <QtSql/QtSql>

class SqlController
{
public:
    SqlController();
    void CreateConnect();
};

#endif // SQLCONTROLLER_H
