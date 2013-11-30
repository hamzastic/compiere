@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title	Export Compiere Database - %COMPIERE_HOME% (%COMPIERE_DB_NAME%)

@Rem $Id: RUN_DBExport.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@Rem Parameter: <compiereDBuser>/<compiereDBpassword>
@call %COMPIERE_DB_PATH%\DBExport %COMPIERE_DB_USER%/%COMPIERE_DB_PASSWORD%

@Rem call %COMPIERE_DB_PATH%\DBExportFull system/%COMPIERE_DB_SYSTEM%

@Echo If the following statement fails, fix your environment
IF (%COMPIERE_HOME%) == () (CALL myDBcopy.bat) else (CALL %COMPIERE_HOME%\utils\myDBcopy.bat)

@Echo Sleeping ... (remove command if you are on XP)
@sleep 60
