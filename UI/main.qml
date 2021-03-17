import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Monty 1.0

Window {
    width: 1024
    height: 680
    visible: true
    title: qsTr("CoffeeSodaDispenserExample")

    SystemController {
        id: systemController
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "HotColdSelectionPage.qml"
    }

    StatusBar {
        id: statusBar
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }
}
