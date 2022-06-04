#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QObject>
#include <QQuickItem>

class FileManager : public QObject
{
    Q_OBJECT
public:
    FileManager();
private:
    QString lastName_ = "";

public slots:
    static QString getStandartWorldName();
    static bool nameAvailable(const QString &name);
    QString lastName();
};

#endif // FILEMANAGER_H
