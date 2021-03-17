import QtQuick 2.0
import Monty 1.0

Rectangle {
    id: mainBackground
    color: {
        if ( systemController.drinkTemperature === SystemController.HOT )
            return "#EE1C25"
        else if ( systemController.drinkTemperature === SystemController.COLD )
            return "#1BA6DF"
    }

    Rectangle {
        id: centerButton
        width: 281
        height: 281
        radius: 281/2
        color: {
            if ( ( systemController.drinkTemperature === SystemController.HOT ) && ( systemController.drinkSize === SystemController.MEDIUM ) )
                return "#F69678"
            else if ( ( systemController.drinkTemperature === SystemController.COLD ) && ( systemController.drinkSize === SystemController.MEDIUM ) )
                return "#9ECCED"
            else
                return "#C4C4C4"
        }
        anchors.centerIn: parent

        Image {
            anchors.centerIn: parent
            width: 110
            height: 110
            source: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    return "qrc:/UI/Assets/coffee-cup.png"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    return "qrc:/UI/Assets/soda.png"
            }

            Text {
                color: "black"
                font.pixelSize: 28
                text: "8oz"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: systemController.setDrinkSize( SystemController.MEDIUM )
        }
    }

    Rectangle {
        id: leftButton
        width: 281
        height: 281
        radius: 281/2

        color: {
            if ( ( systemController.drinkTemperature === SystemController.HOT ) && ( systemController.drinkSize === SystemController.SMALL ) )
                return "#F69678"
            else if ( ( systemController.drinkTemperature === SystemController.COLD ) && ( systemController.drinkSize === SystemController.SMALL ) )
                return "#9ECCED"
            else
                return "#C4C4C4"
        }
        anchors {
            right: centerButton.left
            rightMargin: 52
            verticalCenter: centerButton.verticalCenter
        }

        Image {
            anchors.centerIn: parent
            width: 75
            height: 75
            source: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    return "qrc:/UI/Assets/coffee-cup.png"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    return "qrc:/UI/Assets/soda.png"
            }

            Text {
                color: "black"
                font.pixelSize: 28
                text: "6oz"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: systemController.setDrinkSize( SystemController.SMALL )
        }
    }

    Rectangle {
        id: rightButton
        width: 281
        height: 281
        radius: 281/2

        color: {
            if ( ( systemController.drinkTemperature === SystemController.HOT ) && ( systemController.drinkSize === SystemController.LARGE ) )
                return "#F69678"
            else if ( ( systemController.drinkTemperature === SystemController.COLD ) && ( systemController.drinkSize === SystemController.LARGE ) )
                return "#9ECCED"
            else
                return "#C4C4C4"
        }
        anchors {
            left: centerButton.right
            leftMargin: 52
            verticalCenter: centerButton.verticalCenter
        }

        Image {
            anchors.centerIn: parent
            width: 156
            height: 156
            source: {
                if ( systemController.drinkTemperature === SystemController.HOT )
                    return "qrc:/UI/Assets/coffee-cup.png"
                else if ( systemController.drinkTemperature === SystemController.COLD )
                    return "qrc:/UI/Assets/soda.png"
            }

            Text {
                color: "black"
                font.pixelSize: 28
                text: "12oz"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 10
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: systemController.setDrinkSize( SystemController.LARGE )
        }

    }

    Image {
        id: backButton
        width: 60
        height: 60
        anchors {
            left: leftButton.left
            bottom: parent.bottom
            bottomMargin: 100
        }

        source: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "qrc:/UI/Assets/previousHot.png"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "qrc:/UI/Assets/previousCold.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                systemController.setDrinkSize( SystemController.NOSIZE )
                stackView.pop()
            }
        }
    }

    Text {
        id: backText
        font.pixelSize: 36
        color: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "#F69678"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "#9ECCED"
        }
        text: "Back"

        anchors {
            top: backButton.bottom
            topMargin: 10
            horizontalCenter: backButton.horizontalCenter
        }
    }

    Image {
        id: startOverButton
        width: 60
        height: 60
        anchors {
            horizontalCenter: startOverText.horizontalCenter
            bottom: startOverText.top
            bottomMargin: 10
        }

        source: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "qrc:/UI/Assets/resetHot.png"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "qrc:/UI/Assets/resetCold.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                systemController.setDrinkSize( SystemController.NOSIZE )
                systemController.setDrinkType( "NONE" )
                systemController.setDrinkTemperature( SystemController.NONE )
                stackView.pop( null )
            }
        }
    }

    Text {
        id: startOverText
        font.pixelSize: 36
        color: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "#F69678"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "#9ECCED"
        }
        text: "Start Over"

        anchors {
            top: backText.top
            right: rightButton.right
        }
    }

    Rectangle {
        id: startButton
        width: 125
        height: 125
        radius: 125 / 2
        color: {
            if ( systemController.drinkTemperature === SystemController.HOT )
                return "#F69678"
            else if ( systemController.drinkTemperature === SystemController.COLD )
                return "#9ECCED"
        }
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: backButton.verticalCenter
        }

        Text {
            anchors.centerIn: parent
            font.pixelSize: 36
            color: mainBackground.color
            text: "Start"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stackView.push( "DispensingScreen.qml" )
        }
    }
}
