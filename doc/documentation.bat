@Rem call with parameter
@Rem	1 - sourcepath entry
@Rem	2 - destination entry
@Rem	3 - parameters
@Rem assumes that you have a file packages.txt in the calling directory

@Rem $Id: documentation.bat,v 1.1.1.3 2005/02/19 01:26:47 marco Exp $
@CALL ..\utils_dev\myDevEnv.bat

@Set CLASSPATH=..\lib\CClient.jar;..\lib\CTools.jar;..\lib\oracle.jar;..\lib\postgresql.jar;..\jPDFPrinterDemo.jar
@Set CLASSPATH=%CLASSPATH%;..\lib\CServer.jar;..\lib\CSTools.jar;..\tools\lib\junit.jar
@Set CLASSPATH=%CLASSPATH%;..\jboss\client\jboss-client.jar;..\jboss\client\jboss-common-client.jar
@Set CLASSPATH=%CLASSPATH%;..\tools\lib\servlet.jar;..\jboss\lib\jboss-system.jar;..\jboss\lib\jboss-jmx.jar

javadoc -sourcepath %1 -d %2 -use -author -breakiterator -version -link http://java.sun.com/j2se/1.4.2/docs/api -link http://java.sun.com/j2ee/sdk_1.3/techdocs/api -splitindex -windowtitle "Compiere %COMPIERE_VERSION% API Documentation" -doctitle "Compiere<sup>TM</sup> API Documentation" -header "<b>Compiere %COMPIERE_VERSION%</b>" -bottom "Copyright (c) 1999-2004 ComPiere, Inc. - Author: Jorg Janke" -overview ..\doc\overview.html %3 -J-Xmx180m @packages.txt



