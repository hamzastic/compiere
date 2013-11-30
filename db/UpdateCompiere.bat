@Title Update local Compiere DB
@Rem	$Id: UpdateCompiere.bat,v 1.1.1.3 2005/02/19 01:26:29 marco Exp $

@dir database\DatabaseBuild.sql

@Echo	requires manual entry of exit

sqlplus compiere/compiere @database\DatabaseBuild.sql

sqlplus compiere/compiere @maintain\Maintenance\DBA_Recompile_Run.sql