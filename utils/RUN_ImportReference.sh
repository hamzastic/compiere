#!/bin/sh
#
# $Id: RUN_ImportReference.sh,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi
. ./myEnvironment.sh Server
echo Import Compiere - $COMPIERE_HOME \($COMPIERE_DB_NAME\)


echo Re-Create Reference User and import $COMPIERE_HOME/data/Compiere.dmp - \($COMPIERE_DB_NAME\)
echo == The import will show warnings. This is OK ==
ls -lsa $COMPIERE_HOME/data/Compiere.dmp
echo Press enter to continue ...
read in

# Parameter: <systemAccount> <CompiereID> <CompierePwd>
sh $COMPIERE_DB_PATH/ImportCompiere.sh system/$COMPIERE_DB_SYSTEM reference reference
