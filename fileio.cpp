#include "fileio.h"
#include <QTextStream>
#include <QFile>
#include <QDir>

FileIO::FileIO(QObject *parent) :
    QObject(parent)
{

}

bool FileIO::writeFile(const QString & filename, const QString & data)
{
    QFile file;

    if (filename.isEmpty() || filename.isNull())
	return false;

    file.setFileName(filename);
    if (!file.open(QIODevice::WriteOnly))
	return false;
    else {
        QTextStream out(&file);
        out << data;
        file.close();
    }
    return true;
}

QString FileIO::readFile(const QString & fname)
{
    QString fileContent;
    QFile file;

    if (fname.isEmpty() || fname.isNull())
	return QString();

    file.setFileName(fname);
    if (!file.open(QIODevice::ReadOnly))
	    return QString();
    else {
	QString line;
	QTextStream t( &file );
	do {
	    line = t.readLine();
	    fileContent += line;
	    if (!line.isNull())
		fileContent += "\n";
	} while (!line.isNull());

	file.close();
    }

    return fileContent;
}

bool FileIO::isDirExists(const QString & dirname)
{
    QDir dir(dirname);
    return dir.exists();
}
