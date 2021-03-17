#include "systemcontroller.h"
#include <QDebug>

SystemController::SystemController(QObject *parent)
    : QObject(parent)
    , m_drinkTemperature( NONE )
    , m_drinkType("NONE")
    , m_drinkSize( NOSIZE )
{

}

SystemController::DrinkTemperatureType SystemController::drinkTemperature() const
{
    return m_drinkTemperature;
}

QString SystemController::drinkType() const
{
    return m_drinkType;
}

SystemController::DrinkSize SystemController::drinkSize() const
{
    return m_drinkSize;
}

void SystemController::startOrder()
{
    qDebug() << "Drink temp: " << ( m_drinkTemperature == HOT ? "Hot" : " Cold" );
    qDebug() << "Drink type: " << m_drinkType;

    QString debugOutDrinkSize;
    switch ( m_drinkSize )
    {
    case SMALL:
        debugOutDrinkSize = "Small";
        break;
    case MEDIUM:
        debugOutDrinkSize = "Medium";
        break;
    case LARGE:
        debugOutDrinkSize = "LARGE";
        break;
    case NOSIZE:
        debugOutDrinkSize = "NO SIZE?";
        break;
    }

    qDebug() << "Drink size: " << debugOutDrinkSize;


}

void SystemController::setDrinkTemperature(SystemController::DrinkTemperatureType drinkType)
{
    if (m_drinkTemperature == drinkType)
        return;

    m_drinkTemperature = drinkType;
    emit drinkTemperatureChanged(m_drinkTemperature);
}

void SystemController::setDrinkType(QString drinkType)
{
    if (m_drinkType == drinkType)
        return;

    m_drinkType = drinkType;
    emit drinkTypeChanged(m_drinkType);
}

void SystemController::setDrinkSize(SystemController::DrinkSize drinkSize)
{
    if (m_drinkSize == drinkSize)
        return;

    m_drinkSize = drinkSize;
    emit drinkSizeChanged(m_drinkSize);
}
