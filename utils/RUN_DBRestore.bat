@Rem $Id: RUN_DBRestore.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Restore Compiere Database from Export - %COMPIERE_HOME% (%COMPIERE_DB_NAME%)


@echo Re-Create Compiere User and import %COMPIERE_HOME%\data\ExpDat.dmp
@dir %COMPIERE_HOME%\data\ExpDat.dmp
@echo == The import will show warnings. This is OK ==
@pause

@Rem Parameter: <systemAccount> <compiereID> <compierePwd>
@call %COMPIERE_DB_PATH%\DBRestore system/%COMPIERE_DB_SYSTEM% %COMPIERE_DB_USER% %COMPIERE_DB_PASSWORD%

@pause
