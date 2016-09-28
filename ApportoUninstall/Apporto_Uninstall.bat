@echo OFF

echo "Uninstalling Apporto"
echo "Killing Apporto processes"
taskkill /f /im BizAppCenterService.exe 
taskkill /f /im ApportoSystray.exe 
sc stop BizAppCenterService >nul
sc delete BizAppCenterService >nul

NET USE Z: /delete >nul
NET USE /persistent:yes Z: \\shares.oakland.edu\free >nul

xcopy /s "Z:\Apportouninstall\Uninstall.vbs" "C:\Program Files\BizAppCenter\" 
xcopy /s "Z:\Apportouninstall\AppsToUninstall.txt" "C:\Program Files\BizAppCenter" 

cscript "C:\Program Files\BizAppCenter\Uninstall.vbs"
echo "Deleting BizAppCenter directory" >nul
rmdir /s /q "C:\Program Files\BizAppCenter" >nul

NET USE Z: /d >nul
echo "Uninstall complete"
pause