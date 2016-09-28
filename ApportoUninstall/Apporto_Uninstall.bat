@echo OFF

echo "Uninstalling Apporto"
echo "Killing Apporto processes"
taskkill /f /im BizAppCenterService.exe
taskkill /f /im ApportoSystray.exe
sc stop BizAppCenterService
sc delete BizAppCenterService

NET USE Z: /delete
NET USE /persistent:yes Z: \\shares.oakland.edu\free

xcopy /s "Z:\Apportouninstall\Uninstall.vbs" "C:\Program Files\BizAppCenter\"
xcopy /s "Z:\Apportouninstall\AppsToUninstall.txt" "C:\Program Files\BizAppCenter"

cscript "C:\Program Files\BizAppCenter\Uninstall.vbs"
echo "Deleting BizAppCenter directory"
rmdir /s /q "C:\Program Files\BizAppCenter"

NET USE Z: /d
echo "Uninstall complete"
pause
