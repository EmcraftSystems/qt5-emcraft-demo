#include "serialio.h"
#include <QTextStream>
#include <QSerialPort>
#include <QDebug>

SerialIO::SerialIO(QObject *parent) :
    QObject(parent)
{

}

QString SerialIO::portName(void)
{
    return port.portName();
}

void SerialIO::setPortName(const QString & pname)
{
    port.setPortName(pname);
    port.setBaudRate(QSerialPort::Baud115200);
    if (!port.open(QIODevice::ReadWrite)) {
	qDebug() << "Cannot open port: " << pname;
	return;
    }
    tstream.setDevice(&port);
}

int SerialIO::write(const QString & data)
{
    if (port.handle() != -1) {
	tstream << data;
	tstream.flush();
    }
    return 0;
}

QString SerialIO::readLine(void)
{
    QString str;
    if (port.handle() == -1)
	return QString();
    else {
	port.waitForReadyRead(1000);
	return tstream.readLine();
    }
    return str;
}

QString SerialIO::readAll(void)
{
    QString str;
    if (port.handle() == -1)
	return QString();
    else {
	port.waitForReadyRead(1000);
	return tstream.readAll();
    }
    return str;
}
