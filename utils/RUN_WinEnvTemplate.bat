@Title Set Windows Environment
@Rem $Id: RUN_WinEnvTemplate.bat,v 1.1.1.3 2005/02/19 01:27:23 marco Exp $

@Echo ===================================
@Echo Setup Client Environment
@Echo ===================================

@cscript //nologo @COMPIERE_HOME@\utils\WinEnv.js @COMPIERE_HOME@ @JAVA_HOME@

