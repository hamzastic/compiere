@Title PLAF Test

@Rem $Id: PLAF_Test.bat,v 1.1.1.3 2005/02/19 01:27:04 marco Exp $
@Rem Put the swing.properties file in the \rje\lib directory
@set JAVA_HOME=D:\j2sdk1.4.0

@Rem 
%JAVA_HOME%\jre\bin\java -cp D:\Compiere\looks\CLooks.jar;%JAVA_HOME%\demo\jfc\SwingSet2\SwingSet2.jar org.compiere.plaf.CompierePLAF SwingSet2

@Pause