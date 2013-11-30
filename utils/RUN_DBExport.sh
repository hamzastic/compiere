# $Id: RUN_DBExport.sh,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $
if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi
. ./myEnvironment.sh Server
echo 	Export Compiere Database - $COMPIERE_HOME \($COMPIERE_DB_NAME\)


# Parameter: <compiereDBuser>/<compiereDBpassword>
sh $COMPIERE_DB_PATH/DBExport.sh $COMPIERE_DB_USER/$COMPIERE_DB_PASSWORD

# sh $COMPIERE_DB_PATH/DBExportFull system/$COMPIERE_DB_SYSTEM

if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi
sh myDBcopy.sh

