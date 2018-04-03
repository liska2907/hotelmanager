import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    title: qsTr("Login Form")
    width: 640
    height: 480
    visible: true
    GridLayout{
        id: grid
        columns: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: lblUserName
            text: qsTr("UserName")
        }

        TextField{
            id: txtUserName
            placeholderText: qsTr("Enter user name")
        }

        Text {
            id: lblPassWord
            text: qsTr("Password")
        }

        TextField{
            id: txtPassword
            placeholderText: qsTr("Enter password")
            echoMode: TextInput.Password
        }

        Button{
            text: qsTr("Login")
        }

        Button{
            text: qsTr("Exit")
            onClicked: Qt.quit()
        }

    }
}
