#!/bin/sh
#
# $Id: RUN_Compiere2.sh,v 1.5 2006/08/09 10:36:46 marco Exp $
#***********************************************************************
# Modifications and additions made by Mayking to this file are subject
# to the Mayking Public License Version 1.0 ("Mayking License"); You may not
# use this modification and additions except in compliance with the Mayking
# License. You may obtain a copy of the Mayking License at
# http://www.mayking.com/opensuite/license.html
# 
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
# the specific language governing rights and limitations under the License.
#
# The Original Code is OPENSUITE 
# The Initial Developer of the Original Code is Mayking
# Portions created by Mayking are Copyright © Mayking. All Rights 
# Reserved. 
#
# Contributor: ML, Mayking .
#****************************************************************************/
#* File: RUN_Compiere2.sh
#  Date         Author         Changes
#  Aug 09 2006  ML             Properties file can be specified in the caller script.
#/

echo Compiere Client $COMPIERE_HOME

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
# ML, Mayking: this let us specify the properties file in the caller script.
if [ $PROP ]; then
  echo "Properties file already setted to $PROP ."
else 
  PROP=-DPropertyFile=$HOME/Compiere.properties
fi

$JAVA -Xms32m -Xmx512m -DCOMPIERE_HOME=$COMPIERE_HOME $PROP -classpath $CLASSPATH org.compiere.Compiere
