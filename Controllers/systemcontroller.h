#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>

class SystemController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(DrinkTemperatureType drinkTemperature READ drinkTemperature WRITE setDrinkTemperature NOTIFY drinkTemperatureChanged)
    Q_PROPERTY(QString drinkType READ drinkType WRITE setDrinkType NOTIFY drinkTypeChanged)
    Q_PROPERTY(DrinkSize drinkSize READ drinkSize WRITE setDrinkSize NOTIFY drinkSizeChanged)

public:
    explicit SystemController(QObject *parent = nullptr);
    enum DrinkTemperatureType {
        NONE,
        HOT,
        COLD
    };
    Q_ENUM( DrinkTemperatureType );

    enum DrinkSize {
        NOSIZE,
        SMALL,
        MEDIUM,
        LARGE
    };
    Q_ENUM( DrinkSize );

    DrinkTemperatureType drinkTemperature() const;

    QString drinkType() const;

    DrinkSize drinkSize() const;
    Q_INVOKABLE void startOrder();

public slots:
    void setDrinkTemperature(DrinkTemperatureType drinkType);

    void setDrinkType(QString drinkType);

    void setDrinkSize(DrinkSize drinkSize);

signals:
    void drinkTemperatureChanged(DrinkTemperatureType drinkType);

    void drinkTypeChanged(QString drinkType);

    void drinkSizeChanged(DrinkSize drinkSize);

private:
    DrinkTemperatureType m_drinkTemperature;
    QString m_drinkType;
    DrinkSize m_drinkSize;
};

#endif // SYSTEMCONTROLLER_H
