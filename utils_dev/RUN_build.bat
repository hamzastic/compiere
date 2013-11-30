@Title Build Compiere Clean
@Rem $Header: /opt/mercurial/repository/CVSRepo/compiere/compiere-all/utils_dev/RUN_build.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@CALL myDevEnv.bat
@IF NOT %COMPIERE_ENV%==Y GOTO NOBUILD

@echo Cleanup ...
@%JAVA_HOME%\bin\java -Dant.home="." %ANT_PROPERTIES% org.apache.tools.ant.Main clean

@echo Building ...
@%JAVA_HOME%\bin\java -Dant.home="." %ANT_PROPERTIES% org.apache.tools.ant.Main -logger org.apache.tools.ant.listener.MailLogger complete
@IF ERRORLEVEL 1 goto ERROR

dir %COMPIERE_INSTALL%

@Echo Done ...
@sleep 60
@exit

:NOBUILD
@Echo Check myDevEnv.bat (copy from myDevEnvTemplate.bat)

:ERROR
@Color fc

@Pause