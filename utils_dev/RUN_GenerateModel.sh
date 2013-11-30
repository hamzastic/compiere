#!/bin/sh
#
# $Id: RUN_GenerateModel.sh,v 1.3 2006/02/15 09:41:42 marco Exp $
echo This script expect a compiere/Compiere2 already present.
echo -n "Continue? (y/N) "
read OK
if [ "$OK" != "y" ]; then
  echo Halted.
  exit 0
fi

if [ $COMPIERE_HOME ]; then
  echo COMPIERE_HOME already setted.
else
  COMPIERE_HOME=../compiere/Compiere2
fi
__MODEL_DIR=../dbPort/src/org/compiere/model/
echo Compiere Client $COMPIERE_HOME
echo Compiere Model $__MODEL_DIR
echo -n "Continue? (y/N) "
read OK
if [ "$OK" != "y" ]; then
  echo Halted.
  exit 0
fi

#	Set directly to overwrite
#COMPIERE_HOME=/Compiere2
#JAVA_HOME=/usr/lib/java

##	Check Java Home
if [ $JAVA_HOME ]; then
  JAVA=$JAVA_HOME/bin/java
else
  JAVA=java
  echo JAVA_HOME is not set.
  echo   You may not be able to start Compiere
  echo   Set JAVA_HOME to the directory of your local JDK.
fi

## Check Compiere Home
if [ $COMPIERE_HOME ]; then
  CLASSPATH=$COMPIERE_HOME/lib/Compiere.jar:$COMPIERE_HOME/lib/CompiereCLib.jar:$CLASSPATH
else
  CLASSPATH=lib/Compiere.jar:lib/CompiereCLib.jar:$CLASSPATH
  echo COMPIERE_HOME is not set
  echo   You may not be able to start Compiere
  echo   Set COMPIERE_HOME to the directory of Compiere2.
fi


# To switch between multiple installs, copy the created Compiere.properties file
# Select the configuration by setting the PROP variable
PROP=-DPropertyFile=GenerateModel.properties

$JAVA -Xms32m -Xmx512m -DCOMPIERE_HOME=$COMPIERE_HOME $PROP -classpath $CLASSPATH org.compiere.util.GenerateModel $__MODEL_DIR/ org.compiere.model "'C','D','A','U'"

