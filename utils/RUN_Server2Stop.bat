@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Compiere Server Stop - %COMPIERE_HOME%

@Rem $Id: RUN_Server2Stop.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@IF '%COMPIERE_APPS_TYPE%' == 'jboss' GOTO JBOSS
@GOTO UNSUPPORTED

:JBOSS
@Set NOPAUSE=Yes
@Set JBOSS_LIB=%JBOSS_HOME%\lib
@Set JBOSS_SERVERLIB=%JBOSS_HOME%\server\compiere\lib
@Set JBOSS_CLASSPATH=%JBOSS_LIB%\jboss-system.jar;%JBOSS_SERVERLIB%\jnpserver.jar;%JBOSS_LIB%\jboss-common.jar;%JBOSS_SERVERLIB%\jmx-adaptor-plugin.jar;%JBOSS_SERVERLIB%\jboss.jar;%JBOSS_SERVERLIB%\jboss-transaction.jar;%JBOSS_SERVERLIB%\jboss-j2ee.jar

@CD %JBOSS_HOME%\bin
Call shutdown --server=jnp://%COMPIERE_APPS_SERVER%:%COMPIERE_JNP_PORT% --shutdown

@Echo Done Stopping Compiere Apps Server %COMPIERE_HOME% (%COMPIERE_DB_NAME%)
@GOTO END

:UNSUPPORTED
@Echo Apps Server stop of %COMPIERE_APPS_TYPE% not supported

:END
@sleep 30
@Exit
