#!/bin/bash

USUARIO=$1
SENHA=$2
DIAS=$3
DATA=$(date +%Y-%m-%d-)
SYNC_LOG=/opt/firebird/logs/backup_firebird.log

echo "**********************************" >> $SYNC_LOG
echo "Inicio do Backup do Banco Firebird" >> $SYNC_LOG
date >> $SYNC_LOG
echo "**********************************" >> $SYNC_LOG

for DIR in /opt/firebird/data/*; do
  if [ -d "$DIR" ]; then
    DIR_NAME=$(basename "$DIR")
    for BANCO in $DIR/*.fdb; do
      if [ -f "$BANCO" ]; then
        BASE=$BANCO
        BACKUP=/backup/$DIR_NAME-$DATA.FBK
        /opt/firebird/bin/./gbak -b -user $USUARIO -pass $SENHA $BASE $BACKUP && gzip $BACKUP
      fi
    done
  fi
done

echo "**********************************" >> $SYNC_LOG
echo "Fim do Backup do Banco Firebird"    >> $SYNC_LOG
date >> $SYNC_LOG
echo "**********************************" >> $SYNC_LOG

if [ $DIAS -gt 0 ]; then
  find /backup -name '*.FBK.gz' -mtime +$DIAS -exec rm {} \;
fi