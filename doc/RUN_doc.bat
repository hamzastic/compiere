@Title API Documentation for entire Product
@Rem $Id: RUN_doc.bat,v 1.1.1.3 2005/02/19 01:26:47 marco Exp $

del /F /S /Q API
rmdir /S /Q API

@call documentation.bat  "..\base\src;..\client\src;..\dbPort\src;..\extend\src;..\interfaces\src;..\looks\src;..\print\src;..\serverApps\src\main\ejb;..\serverApps\src\main\servlet;..\serverRoot\src\main\client;..\serverRoot\src\main\ejb;..\serverRoot\src\main\server;..\serverRoot\src\main\servlet;..\tools\src" API

@pause


