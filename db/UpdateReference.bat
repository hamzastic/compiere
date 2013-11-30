@Title Update local Reference DB
@Rem	$Id: UpdateReference.bat,v 1.1.1.1 2005/01/08 19:05:21 marco Exp $

@dir database\DatabaseBuild.sql

@Echo	requires manual entry of exit

sqlplus reference/reference @database\DatabaseBuild.sql

sqlplus reference/reference @maintain\Maintenance\DBA_Recompile_Run.sql