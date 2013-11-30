@Rem $Id: RUN_ImportReference.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@if (%COMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %COMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Import Reference - %COMPIERE_HOME% (%COMPIERE_DB_NAME%)


@echo Re-Create Reference User and import %COMPIERE_HOME%\data\compiere.dmp - (%COMPIERE_DB_NAME%)
@dir %COMPIERE_HOME%\data\compiere.dmp
@echo == The import will show warnings. This is OK ==
@pause

@Rem Parameter: <systemAccount> <CompiereID> <CompierePwd>
@call %COMPIERE_DB_PATH%\ImportCompiere system/%COMPIERE_DB_SYSTEM% reference reference

@pause
