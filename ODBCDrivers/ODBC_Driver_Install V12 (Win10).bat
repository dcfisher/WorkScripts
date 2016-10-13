@ECHO OFF 



echo "Installing ODBC Drivers"
NET USE M: /delete

REM Detect OS architecture
if %PROCESSOR_ARCHITECTURE% == AMD64 goto 64bit


REM 32-bit OS detected

NET USE M: \\shares.oakland.edu\oraclient_user12c32 /persistent:yes
start M:\setup\user12c32_install_oraclient.bat
goto EoF

:64bit
REM 64-bit OS detected

NET USE M: \\shares.oakland.edu\oraclient_user12c64 /persistent:yes
start M:\setup\user12c64_install_oraclient.bat

echo "Installation Complete"

pause