@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Start Compiere  - %COMPIERE_HOME% (%COMPIERE_DB_NAME%)

@Rem $Id: RUN_Start.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@Echo Starting Database
@CALL %COMPIERE_DB_PATH%\Start.bat

@START %COMPIERE_HOME%\utils\RUN_Server2.bat 
