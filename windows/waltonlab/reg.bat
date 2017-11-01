:: load this rc file every time a command prompt is opened
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor" /v AutoRun /d "S:\jpucket\dotfiles\windows\waltonlab\cmdrc.bat"

:: add show file extensions to regedit
:: https://superuser.com/a/666895/571125
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

:: pin favorite folders
net use S: \\Ent-Storage1.walton.uark.edu\Enterprise$
Powershell.exe -executionpolicy Unrestricted -File  S:\jpucket\dotfiles\windows\waltonlab\rc.ps1

pause
cls
exit
