#include "sqlcontroller.h"

SqlController::SqlController()
{

}

void SqlController::CreateConnect()
{
    //hello
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("HotelManager");
    db.setUserName("liska");
    db.setPassword("L!ska297");
    bool ok = db.open();
    if(ok){
        std::cout << "OK" << std::endl;
        QSqlQuery querry("SELECT id from user");
        while(querry.next())
        {
            QString id = querry.value(0).toString();
            std::string utf8_text = id.toUtf8().constData();
            std::cout << utf8_text << std::endl;
        }
    }
}
