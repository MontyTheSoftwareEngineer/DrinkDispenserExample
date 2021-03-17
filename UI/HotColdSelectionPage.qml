import QtQuick 2.0
import Monty 1.0

Item {
    Rectangle {
        id: hotRectangle
        height: parent.height
        width: parent.width / 2
        anchors {
            top: parent.top
            left: parent.left
        }
        color: "#EE1C25"

        Image {
            id: hotImage
            width: 256
            height: 256
            anchors.centerIn: parent
            source: "qrc:/UI/Assets/hot.png"
        }

        Text {
            anchors {
                top: hotImage.bottom
                topMargin: 40
                horizontalCenter: parent.horizontalCenter
            }
            font.pixelSize: 96
            color: "#F69678"
            text: "Hot"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                systemController.setDrinkTemperature( SystemController.HOT )
                stackView.push( "DrinkTypePage.qml" )
            }

        }
    }

    Rectangle {
        id: coldRectangle
        height: parent.height
        width: parent.width / 2
        anchors {
            top: parent.top
            right: parent.right
        }
        color: "#1BA6DF"

        Image {
            id: coldImage
            width: 256
            height: 256
            anchors.centerIn: parent
            source: "qrc:/UI/Assets/snowflake.png"
        }

        Text {
            anchors {
                top: coldImage.bottom
                topMargin: 40
                horizontalCenter: parent.horizontalCenter
            }
            font.pixelSize: 96
            color: "#9ECCED"
            text: "Cold"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                systemController.setDrinkTemperature( SystemController.COLD )
                stackView.push( "DrinkTypePage.qml" )
            }

        }
    }
}
