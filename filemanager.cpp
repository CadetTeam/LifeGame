#include "filemanager.h"
#include <QDir>

using namespace Qt;

FileManager::FileManager()
{

}

QString FileManager::getStandartWorldName()
{
    QString standartWorldName = tr("Новый мир №");
    size_t index = 1;
    QStringList homeDir = QDir::current().entryList();
    while(homeDir.contains(standartWorldName + QString::number(index))) index++;

    return (standartWorldName + QString::number(index));
}

bool FileManager::nameAvailable(const QString &name)
{
    return not QDir::current().entryList().contains(name);
}

QString FileManager::lastName()
{
    return lastName_;
}
