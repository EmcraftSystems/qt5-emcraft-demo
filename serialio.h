#include <QObject>
#include <QString>
#include <QSerialPort>
#include <QTextStream>

class SerialIO : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString pname READ portName WRITE setPortName)
    //TODO
    //Q_PROPERTY(QString baud READ getBaudRate WRITE setBaudRate)

public:
    explicit SerialIO(QObject *parent = 0);
    void setPortName(const QString & pname);
    QString portName(void);
    //TODO
    //void setBaudRate(int);
    Q_INVOKABLE QString readLine(void);
    Q_INVOKABLE QString readAll(void);
    Q_INVOKABLE int write(const QString & data);
private:
    QSerialPort port;
    QTextStream tstream;
};
