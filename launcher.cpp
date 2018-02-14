#include "launcher.h"

Launcher::Launcher(QObject *parent) :
    QObject(parent),
    m_process(new QProcess(this))
{
    connect(m_process, SIGNAL(finished(int, QProcess::ExitStatus)),
	    this, SIGNAL(complete(int, QProcess::ExitStatus)));
}

Q_PID Launcher::start(const QString &program)
{
    m_process->start(program);
    return m_process->pid();
}

void Launcher::kill(void)
{
    if (m_process->state() != QProcess::NotRunning) {
	m_process->kill();
    }
}

QString Launcher::readAll(void)
{
    QString output = NULL;
    if (m_process->state() == QProcess::NotRunning) {
	QByteArray bytes = m_process->readAllStandardOutput();
	output = QString::fromLocal8Bit(bytes);
    }
    return output;
}

void Launcher::wait(void)
{
    if (m_process->state() != QProcess::NotRunning) {
	m_process->waitForFinished(-1);
    }
    return;
}

void Launcher::start_wait(const QString &program)
{
    // We want the finished() signal to be emitted only during
    // asynchronous launch
    m_process->blockSignals(true);
    m_process->start(program);
    m_process->waitForFinished(-1);
    m_process->blockSignals(false);
}

QString Launcher::start_readAll(const QString &program)
{
    // We want the finished() signal to be emitted only during
    // asynchronous launch
    m_process->blockSignals(true);
    m_process->start(program);
    m_process->waitForFinished(-1);
    QByteArray bytes = m_process->readAllStandardOutput();
    QString output = QString::fromLocal8Bit(bytes);
    m_process->blockSignals(false);
    return output;
}

Launcher::~Launcher()
{

}
