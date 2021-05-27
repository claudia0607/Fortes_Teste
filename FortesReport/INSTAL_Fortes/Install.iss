[Files]
Source: dbexpUIBfire15.dll; DestDir: {sys}
Source: midas.dll; DestDir: {sys}
Source: ..\Arquivos de programas\Borland\Delphi7\Bin\dbexpint.dll; DestDir: {app}
Source: Firebird-1.5.2.4731-Win32.exe; DestDir: {tmp}; Flags: deleteafterinstall
Source: DADOS\BDFORTES.FDB; DestDir: {app}\DADOS
Source: SisTeste.exe; DestDir: {app}
Source: dbxconnections.ini; DestDir: {app}
[Run]
Filename: {tmp}\Firebird-1.5.2.4731-Win32.exe; WorkingDir: {tmp}
[Setup]
VersionInfoVersion=1.0
VersionInfoCompany=Cláudia
AppName=SISTESTE
AppVerName=1.0
Password=123
DefaultDirName=C:\TesteFortes
