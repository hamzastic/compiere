# $Id: RUN_DBStop.sh,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $
if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi
. ./myEnvironment.sh Server
echo Stop DataBase Service - $COMPIERE_HOME \($COMPIERE_DB_NAME\)


sh $COMPIERE_DB_PATH/Stop.sh

