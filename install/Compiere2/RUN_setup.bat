@Title Install Compiere Server
@Rem  $Header: /opt/mercurial/repository/CVSRepo/compiere/compiere-all/install/Compiere2/RUN_setup.bat,v 1.2 2007/06/15 16:25:40 nicola Exp $
@Echo off


@if not "%JAVA_HOME%" == "" goto JAVA_HOME_OK
@Set JAVA=java
@Echo JAVA_HOME is not set.  
@Echo You may not be able to start the required Setup window !!
@Echo Set JAVA_HOME to the directory of your local 1.4 JDK.
@Echo If you experience problems, run utils/WinEnv.js
@Echo Example: cscript utils\WinEnv.js C:\Compiere2 C:\j2sdk1.4.2_06
goto START

:JAVA_HOME_OK
@Set JAVA=%JAVA_HOME%\bin\java


:START
@Echo =======================================
@Echo Starting Setup Dialog ...
@Echo =======================================
@SET CP=lib\CInstall.jar;lib\Compiere.jar;lib\CCTools.jar;lib\oracle.jar;lib\sybase.jar;lib\jboss.jar;lib\postgresql.jar;

@Rem Trace Level Parameter, e.g. SET ARGS=ALL
@SET ARGS=CONFIG

@%JAVA% -classpath %CP% -DCOMPIERE_HOME=%COMPIERE_HOME% org.compiere.install.Setup %ARGS%
@Echo ErrorLevel = %ERRORLEVEL%
@IF NOT ERRORLEVEL = 1 GOTO NEXT
@Echo ***************************************
@Echo You MUST set the environment correctly!
@Echo ***************************************
@Echo Set environment variable JAVA_HOME manually
@Echo or use WinEnv.js in the util directory
@Echo ***************************************
@Pause
@Exit


:NEXT
@Rem ===================================
@Rem Run Ant directly
@Rem ===================================
@Rem %JAVA% -classpath lib\CInstall.jar; -DCOMPIERE_HOME=%COMPIERE_HOME% -Dant.home="." org.apache.tools.ant.launch.Launcher setup


@Rem ===================================
@Rem Setup Compiere Environment
@Rem ===================================
@Call utils\RUN_WinEnv.bat


@Rem ================================
@Rem Test local Connection
@Rem ================================
@Rem %JAVA% -classpath lib\Compiere.jar;lib\CompiereCLib.jar org.compiere.install.ConnectTest localhost


@Echo .
@Echo For problems, check log file in base directory
@pause