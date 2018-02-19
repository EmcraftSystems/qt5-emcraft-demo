#include <QObject>
#include <QString>

class FileIO : public QObject
{
    Q_OBJECT

public:
    explicit FileIO(QObject *parent = 0);
    Q_INVOKABLE QString readFile(const QString & filename);
    Q_INVOKABLE bool writeFile(const QString & filename, const QString & data);
    Q_INVOKABLE bool isDirExists(const QString & dirname);
};
