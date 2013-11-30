#!/bin/sh
# Transfer Compiere Database

# $Id: RUN_PutExportTemplate.sh,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $
if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi
. ./myEnvironment.sh Server
echo Transfer Compiere Database - $COMPIERE_HOME \($COMPIERE_DB_NAME\)


Echo ........ Export DB
sh $COMPIERE_DB_PATH/DBExport.sh $COMPIERE_DB_USER/$COMPIERE_DB_PASSWORD

Echo ........ Stop DB
sqlplus "system/$COMPIERE_DB_SYSTEM AS SYSDBA" @$COMPIERE_HOME/utils/$COMPIERE_DB_PATH/Stop.sql

echo ........ FTP
ping @COMPIERE_FTP_SERVER@
cd $COMPIERE_HOME/data
ls ExpDat.*

ftp -s:$COMPIERE_HOME/utils/ftpPutExport.txt

echo ........ Done
