//![2]
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
//![2]
import QtCharts 2.0

ApplicationWindow {
    id: window
    visible: true
    title: "Hotel Management Software"
    visibility: "Maximized"
    property int margin: 11
    width: mainLayout.implicitWidth + 2 * margin
    height: mainLayout.implicitHeight + 2 * margin
    minimumWidth: mainLayout.Layout.minimumWidth + 2 * margin
    minimumHeight: mainLayout.Layout.minimumHeight + 2 * margin


    header: ToolBar {
        Material.foreground: "white"

        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                icon.source: stackView.depth > 1 ? "qrc:/icons/gallery/20x20/back.png" : "qrc:/icons/gallery/20x20/drawer.png"
                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                        listView.currentIndex = -1
                    } else {
                        drawer.open()
                    }
                }
            }

            Label {
                id: titleLabel
                text: listView.currentItem ? listView.currentItem.text : "DashBoard"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                icon.source: "qrc:/icons/gallery/20x20/menu.png"
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    MenuItem {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }
    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        interactive: stackView.depth === 1

        ListView {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
//                ListElement { title: "BusyIndicator"; source: "qrc:/pages/BusyIndicatorPage.qml" }
                ListElement { title: "Dashboard"; }
                ListElement { title: "Reports"; }
                ListElement { title: "Employees"; }
                ListElement { title: "Hotels"; }
                ListElement { title: "Products"; }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        ColumnLayout{
            id: mainLayout
            anchors.fill: parent
            anchors.margins: margin
            GroupBox {
                id: rowBox
                title: "Information"
                Layout.fillWidth: true

                RowLayout {
                    id: rowLayoutInformation
                    anchors.fill: parent
                    Text
                    {
                        text: qsTr("Hello Mr. Dinh Quang Thu");
                    }
                }
            }

            GroupBox{
                id: comboBox
                title: "ComboBox"
                height: 10
                Layout.fillWidth: true
                RowLayout{
                    ComboBox{
                        editable: true
                        model: ListModel {
                            id: model
                            ListElement { text: "Banana" }
                            ListElement { text: "Apple" }
                            ListElement { text: "Coconut" }
                        }
                        onAccepted: {
                            if (find(editText) === -1)
                                model.append({text: editText})
                        }
                    }
                    Label{
                        text: qsTr("From:")
                    }

                    TextField{
                        id: textDateFrom
                        activeFocusOnPress: false
                        placeholderText: qsTr("Date")
                        text: textDateFrom.text = Qt.formatDate(calFrom.selectedDate, "dd/MM/yyyy")
                    }

                    ToolButton{
                        icon.source: "qrc:/icons/gallery/20x20/calendar.png"
                        onClicked: {
                            calFrom.visible = true
                        }
                    }

                    Calendar{
                        id: calFrom
                        visible: false
                        selectedDate: new Date()
                        onClicked: {
                            textDateFrom.text = Qt.formatDate(calFrom.selectedDate, "dd/MM/yyyy");
                            calFrom.visible = false
                        }
                    }

                    Label{
                        text: qsTr("To:")
                    }

                    TextField{
                        id: textDateTo
                        activeFocusOnPress: false
                        placeholderText: qsTr("Date")
                        text: textDateTo.text = Qt.formatDate(calTo.selectedDate, "dd/MM/yyyy")
                    }

                    ToolButton{
                        icon.source: "qrc:/icons/gallery/20x20/calendar.png"
                        onClicked: {
                            calTo.visible = true
                        }
                    }

                    Calendar{
                        id: calTo
                        visible: false
                        selectedDate: new Date()
                        onClicked: {
                            textDateTo.text = Qt.formatDate(calTo.selectedDate, "dd/MM/yyyy");
                            calTo.visible = false
                        }
                    }
                }
            }

            GroupBox{
                id: chartBox
                title: "Charts"
                Layout.fillWidth: true
                Layout.fillHeight: true

                GridLayout{
                    id: gridLayoutCharts
                    rows: 1
                    flow: GridLayout.TopToBottom
                    anchors.fill: parent
                    Rectangle{
                        width: 100
                        height: 100
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Item {
                            id: item1
                            anchors.fill: parent
                            property variant othersSlice: 0
                            ChartView {
                                id: chart
                                title: "Incomes"
                                anchors.fill: parent
                                legend.alignment: Qt.AlignBottom
                                antialiasing: true

                                PieSeries {
                                    PieSlice { label: "Incomes"; value: 10 }
                                    PieSlice { label: "OutComes"; value: 90 }
                                }
                            }
                        }
                    }
                    Rectangle{
                        width: 100
                        height: 100
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        color: "red"
                        Item {
                            id: item2
                            anchors.fill: parent
                            property variant othersSlice: 0
                            ChartView {
                                id: chart1
                                title: "Incomes"
                                anchors.fill: parent
                                legend.alignment: Qt.AlignBottom
                                antialiasing: true

                                HorizontalBarSeries {
                                    axisY: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
                                    BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
                                    BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
                                    BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
                                }
                            }
                        }
                    }
                    Rectangle{
                        width: 100
                        height: 100
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        color: "red"
                        Item {
                            id: item3
                            anchors.fill: parent
                            property variant othersSlice: 0
                            ChartView {
                                id: chart2
                                title: "Incomes"
                                anchors.fill: parent
                                legend.alignment: Qt.AlignBottom
                                antialiasing: true

                                BarSeries {
                                    axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
                                    BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
                                    BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
                                    BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    footer: ToolBar
    {
        Text {
            id: txtStatus
            text: qsTr("connect")
        }
    }
}


