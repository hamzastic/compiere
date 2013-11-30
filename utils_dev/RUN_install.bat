@Title Compiere Install
@Rem $Header: /opt/mercurial/repository/CVSRepo/compiere/compiere-all/utils_dev/RUN_install.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@CALL myDevEnv.bat
@IF NOT %COMPIERE_ENV%==Y GOTO NOBUILD

@%JAVA_HOME%\bin\java -Dant.home="." %ANT_PROPERTIES% org.apache.tools.ant.Main install

@Pause
@exit
:NOBUILD
@Echo Check myDevEnv.bat (copy from myDevEnvTemplate.bat)
@Pause
