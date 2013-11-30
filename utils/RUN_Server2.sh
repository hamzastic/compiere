#!/bin/sh
# Compiere Server Start
#
# $Id: RUN_Server2.sh,v 1.2 2006/12/04 21:10:00 marco Exp $

if [ $COMPIERE_HOME ]; then
  cd $COMPIERE_HOME/utils
fi

. ./myEnvironment.sh Server
echo Compiere Server Start - $COMPIERE_HOME \($COMPIERE_DB_NAME\)

# headless option if you don't have X installed on the server
JAVA_OPTS="-server $COMPIERE_JAVA_OPTIONS -Djava.awt.headless=true $JAVA_OPTS"   # ML, Mayking: preserve external JAVA_OPTS

export JAVA_OPTS

$JBOSS_HOME/bin/run.sh -c compiere
