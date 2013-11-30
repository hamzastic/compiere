#!/bin/sh
#
echo Install Compiere Server
# $Header: /opt/mercurial/repository/CVSRepo/compiere/compiere-all/install/Compiere2/RUN_setup.sh,v 1.5 2007/06/15 16:25:40 nicola Exp $

if [ $JAVA_HOME ]; then
  JAVA=$JAVA_HOME/bin/java
  KEYTOOL=$JAVA_HOME/bin/keytool
else
  JAVA=java
  KEYTOOL=keytool
  echo JAVA_HOME is not set.
  echo You may not be able to start the Setup
  echo Set JAVA_HOME to the directory of your local JDK.
fi


echo ===================================
echo Setup Dialog
echo ===================================
# ML, Mayking: this should fix the RUN_Setup.sh crash.
CP=$ORACLE_HOME/jdbc/lib/ojdbc14.jar:lib/CInstall.jar:lib/Compiere.jar:lib/CCTools.jar:lib/oracle.jar:lib/sybase.jar:lib/jboss.jar:lib/postgresql.jar:
# End ML, Mayking .

# Trace Level Parameter, e.g. ARGS=ALL
ARGS=CONFIG

$JAVA -classpath $CP -DCOMPIERE_HOME=$COMPIERE_HOME org.compiere.install.Setup $ARGS


#echo ===================================
#echo Setup Compiere Server Environment
#echo ===================================
#$JAVA -classpath $CP -DCOMPIERE_HOME=$COMPIERE_HOME -Dant.home="." org.apache.tools.ant.launch.Launcher setup


echo ===================================
echo Make .sh executable & set Env
echo ===================================
chmod -R a+x *.sh
find . -name '*.sh' -exec chmod a+x '{}' \;

. utils/RUN_UnixEnv.sh

#echo ================================
#echo	Test local Connection
#echo ================================
#%JAVA% -classpath lib/Compiere.jar:lib/CompiereCLib.jar org.compiere.install.ConnectTest localhost

echo .
echo For problems, check log file in base directory
