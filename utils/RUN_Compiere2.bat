@Title	Compiere Client %COMPIERE_HOME%   %1%
@Rem $Id: RUN_Compiere2.bat,v 1.1.1.4 2005/02/20 03:20:16 marco Exp $
@Echo off

@Rem Set/Overwrite COMPIERE_HOME/JAVA_HOME 
@Rem explicitly here for different versions, etc. e.g.
@Rem
@Rem SET COMPIERE_HOME=C:\R251\Compiere2
@Rem SET JAVA_HOME=C:\j2sdk1.4.2_06

:CHECK_JAVA:
@if not "%JAVA_HOME%" == "" goto JAVA_HOME_OK
@Set JAVA=java
@Echo JAVA_HOME is not set.  
@Echo   You may not be able to start Compiere
@Echo   Set JAVA_HOME to the directory of your local JDK.
@Echo   You could set it via WinEnv.js e.g.:
@Echo     cscript WinEnv.js C:\Compiere2 C:\j2sdk1.4.2_06
@goto CHECK_COMPIERE
:JAVA_HOME_OK
@Set JAVA=%JAVA_HOME%\bin\java

:CHECK_COMPIERE
@if not "%COMPIERE_HOME%" == "" goto COMPIERE_HOME_OK
Set CLASSPATH=lib\Compiere.jar;lib\CompiereCLib.jar;%CLASSPATH%
set COMPIERE_HOME=%~dp0..
@Echo COMPIERE_HOME is not set.  
@Echo   You may not be able to start Compiere
@Echo   Set COMPIERE_HOME to the directory of Compiere2.
@Echo   You could set it via WinEnv.js e.g.:
@Echo     cscript WinEnv.js C:\Compiere2 C:\j2sdk1.4.2_06
@goto START
:COMPIERE_HOME_OK
@Set CLASSPATH=%COMPIERE_HOME%\lib\Compiere.jar;%COMPIERE_HOME%\lib\CompiereCLib.jar;%CLASSPATH%

@REM To switch between multiple installs, copy the created Compiere.properties file
@REM Select the configuration by setting the PROP variable
@SET PROP=
@Rem SET PROP=-DPropertyFile=C:\test.properties
@REM Alternatively use parameter
@if "%1" == "" goto START
@SET PROP=-DPropertyFile=%1

:START
@"%JAVA%" -Xms32m -Xmx512m -DCOMPIERE_HOME=%COMPIERE_HOME% %PROP% -classpath %CLASSPATH% org.compiere.Compiere 

@sleep 15