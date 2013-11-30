@Rem $Id: RUN_TrlExport.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Export Translation - %COMPIERE_HOME% (%COMPIERE_DB_NAME%)

@SET AD_LANGUAGE=de_DE
@SET DIRECTORY=%COMPIERE_HOME%\data\%AD_LANGUAGE%

@echo This Procedure exports language %AD_LANGUAGE% into directory %DIRECTORY%
@pause

@%JAVA_HOME%\bin\java -cp %CLASSPATH% org.compiere.install.Translation %DIRECTORY% %AD_LANGUAGE% export

@pause
