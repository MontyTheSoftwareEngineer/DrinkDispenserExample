import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Monty 1.0

Rectangle {

    Timer {
        id: dispensingTimer
        interval: 3000
        running: false
        onTriggered: stackView.push("FinishScreen.qml")
    }

    Component.onCompleted: {
        systemController.startOrder()
        dispensingTimer.start()
    }

    id: mainBackground
    color: {
        if ( systemController.drinkTemperature === SystemController.HOT )
            return "#EE1C25"
        else if ( systemController.drinkTemperature === SystemController.COLD )
            return "#1BA6DF"
    }

    BusyIndicator {
        id: dispensingBusyIndicator
        anchors.centerIn: parent
        width: 281
        height: 281
        Material.accent: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "#F69678"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "#9ECCED"
        }
    }

    Text {
        font.pixelSize: 96
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: dispensingBusyIndicator.bottom
            topMargin: 15
        }

        color: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "#F69678"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "#9ECCED"
        }
        text: "Dispensing..."
    }
}
