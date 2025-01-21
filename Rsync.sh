#!/bin/bash

# Исходная директория
SOURCE_DIR="/home/admin/."
# Целевая директория
TARGET_DIR="/tmp/backup"
# Команда rsync. Cтандартный вывод - в /dev/null, ошибки - в лог.
rsync -ac --delete --exclude '.*' "$SOURCE_DIR" "$TARGET_DIR" > /dev/null 2>> /var/log/backup.log

# Проверка кода завершения rsync и запись лога
if [ $? -eq 0 ]; then
    echo "[$(date)] Successful Backup" >> /var/log/backup.log
else
    echo "[$(date)] Backup Error" >> /var/log/backup.log
fi
