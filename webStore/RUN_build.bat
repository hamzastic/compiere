@Title Build Compiere WebStore
@Rem $Header: /opt/mercurial/repository/CVSRepo/compiere/compiere-all/webStore/RUN_build.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@CALL ..\utils_dev\myDevEnv.bat

@IF %COMPIERE_ENV%==N GOTO NOBUILD
@echo Cleanup ...
@%JAVA_HOME%\bin\java -Dant.home="." %ANT_PROPERTIES% org.apache.tools.ant.launch.Launcher clean
@echo Building ...
@%JAVA_HOME%\bin\java -Dant.home="." %ANT_PROPERTIES% org.apache.tools.ant.launch.Launcher

@pause
:NOBUILD