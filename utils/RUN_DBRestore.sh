# $Id: RUN_DBRestore.sh,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $
if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi
. ./myEnvironment.sh Server
echo Restore Compiere Database from Export- $COMPIERE_HOME \($COMPIERE_DB_NAME\)


echo Re-Create Compiere User and import $COMPIERE_HOME/data/ExpDat.dmp
echo == The import will show warnings. This is OK ==
ls -lsa $COMPIERE_HOME/data/ExpDat.dmp
echo Press enter to continue ...
read in

# Parameter: <systemAccount> <compiereID> <compierePwd>
sh $COMPIERE_DB_PATH/DBRestore.sh system/$COMPIERE_DB_SYSTEM $COMPIERE_DB_USER $COMPIERE_DB_PASSWORD
