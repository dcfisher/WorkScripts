@ECHO OFF 



echo "Installing ODBC Drivers"
NET USE M: /delete

REM Detect OS architecture
if %PROCESSOR_ARCHITECTURE% == AMD64 goto 64bit


REM 32-bit OS detected

NET USE /persistent:yes M: \\shares.oakland.edu\oraclient_user11g32 
start M:\setup\user11g32_install_oraclient.bat
goto EoF

:64bit
REM 64-bit OS detected

NET USE /persistent:yes M: \\shares.oakland.edu\oraclient_user11g64
start M:\setup\user11g64_install_oraclient.bat

echo "Installation Complete"

pause