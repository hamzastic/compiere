#!/bin/sh
# Compiere Server Start
#
# $Id: RUN_Server2Stop.sh,v 1.2 2007/11/14 15:45:14 marco Exp $

if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi

. ./myEnvironment.sh Server
echo Compiere Server Stop - $COMPIERE_HOME \($COMPIERE_DB_NAME\)

JBOSS_LIB=$JBOSS_HOME/lib
export JBOSS_LIB
JBOSS_SERVERLIB=$JBOSS_HOME/server/compiere/lib
export JBOSS_SERVERLIB
JBOSS_CLASSPATH=$JBOSS_LIB/jboss-system.jar:$JBOSS_SERVERLIB/jnpserver.jar:$JBOSS_LIB/jboss-common.jar:$JBOSS_SERVERLIB/jmx-adaptor-plugin.jar:$JBOSS_SERVERLIB/jboss.jar:$JBOSS_SERVERLIB/jboss-transaction.jar:$JBOSS_SERVERLIB/jboss-j2ee.jar
export JBOSS_CLASSPATH

echo shutdown.sh --server=jnp://$COMPIERE_APPS_SERVER:$COMPIERE_JNP_PORT
exec $JBOSS_HOME/bin/shutdown.sh --server=jnp://$COMPIERE_APPS_SERVER:$COMPIERE_JNP_PORT --shutdown
