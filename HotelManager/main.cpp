#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <sqlcontroller.h>
#include <QSettings>
#include <QIcon>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    SqlController *sql1 = new SqlController();
    sql1->CreateConnect();
//    QGuiApplication app(argc, argv);
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/Boss_Form_1.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
