@Rem $Id: RUN_ImportCompiere.bat,v 1.2 2007/06/15 16:29:29 nicola Exp $

@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Import Compiere - %COMPIERE_HOME% (%COMPIERE_DB_NAME%)


@Rem echo Re-Create Compiere User and import %COMPIERE_HOME%\data\compiere.dmp - (%COMPIERE_DB_NAME%)
@Rem dir %COMPIERE_HOME%\data\compiere.dmp
@echo == The import may show warnings. This is OK ==
@pause

@Rem Parameter: <systemAccount> <CompiereID> <CompierePwd>
@call %COMPIERE_DB_PATH%\ImportCompiere system/%COMPIERE_DB_SYSTEM% %COMPIERE_DB_USER% %COMPIERE_DB_PASSWORD%

@pause
