@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Compiere Server Start - %COMPIERE_HOME% (%COMPIERE_APPS_TYPE%)

@Rem $Id: RUN_Server2.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@IF '%COMPIERE_APPS_TYPE%' == 'jboss' GOTO JBOSS
@GOTO UNSUPPORTED

:JBOSS
@Set NOPAUSE=Yes
@Set JAVA_OPTS=-server %COMPIERE_JAVA_OPTIONS%
@Call %JBOSS_HOME%\bin\run -c compiere
@Echo Done Compiere Apps Server %COMPIERE_HOME% (%COMPIERE_DB_NAME%)
@GOTO END

:UNSUPPORTED
@Echo Apps Server start of %COMPIERE_APPS_TYPE% not supported

:END
@Sleep 60
@Exit

