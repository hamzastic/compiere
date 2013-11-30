#!/bin/sh
#
# $Id: RUN_ImportMayking.sh,v 1.1 2005/10/31 11:10:21 marco Exp $

if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi
. ./myEnvironment.sh Server
echo Import Compiere - $COMPIERE_HOME \($COMPIERE_DB_NAME\)


echo Re-Create Compiere User and import $COMPIERE_HOME/data/MaykingDemo.dmp - \($COMPIERE_DB_NAME\)
echo == The import will show warnings. This is OK ==
ls -lsa $COMPIERE_HOME/data/MaykingDemo.dmp
echo Press enter to continue ...
read in

# Parameter: <systemAccount> <CompiereID> <CompierePwd>
sh $COMPIERE_DB_PATH/ImportMayking.sh system/$COMPIERE_DB_SYSTEM $COMPIERE_DB_USER $COMPIERE_DB_PASSWORD
