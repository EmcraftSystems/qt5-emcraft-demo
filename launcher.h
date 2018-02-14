#include <QObject>
#include <QProcess>

class Launcher : public QObject
{
    Q_OBJECT

public:
    explicit Launcher(QObject *parent = 0);
    ~Launcher();
    Q_INVOKABLE Q_PID start(const QString &cmd);
    Q_INVOKABLE void kill(void);
    Q_INVOKABLE QString readAll(void);
    Q_INVOKABLE void wait(void);
    Q_INVOKABLE void start_wait(const QString &cmd);
    Q_INVOKABLE QString start_readAll(const QString &cmd);

signals:
    void complete(int exitCode, QProcess::ExitStatus exitStatus);

protected:
    QProcess *m_process;
};
