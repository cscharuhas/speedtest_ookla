@ECHO OFF

TITLE Speedtest

if not exist C:\Users\%username%\Desktop\speedtest goto make_dir
if exist C:\Users\%username%\Desktop\speedtest\ookla\speedtest.exe (
ECHO Initial Setup is already done on your system.
goto create_task )


:make_dir
mkdir C:\Users\%username%\Desktop\speedtest
ECHO Created Directory C:\Users\%username%\Desktop\speedtest.
goto download_ookla

	
:download_ookla
ECHO Downloading the required files for the initial setup.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-win64.zip', 'C:\Users\%username%\Desktop\speedtest\ookla.zip')"
powerShell -Command Expand-Archive -Path "C:\Users\%username%\Desktop\speedtest\ookla.zip" -DestinationPath "C:\Users\%username%\Desktop\speedtest\ookla\."
ECHO Downloaded and extracted the needed OOKLA.zip file.
goto create_task


:execute_batch
ECHO Executing the speedtest check. Please be patient this might take a couple of minutes to finish.
ECHO ==================================================== >> C:\Users\%username%\Desktop\speedtest\speedtest.log
ECHO Test done on %date% %time% >> C:\Users\%username%\Desktop\speedtest\speedtest.log
C:\Users\%username%\Desktop\speedtest\ookla\speedtest.exe >> C:\Users\%username%\Desktop\speedtest\speedtest.log
ECHO ==================================================== >> C:\Users\%username%\Desktop\speedtest\speedtest.log
ECHO Completed Execution. The test results are stored in the C:\Users\%username%\Desktop\speedtest\speedtest.log file.
TIMEOUT /T 10 /NOBREAK
exit	


:create_task
if exist %WINDIR%\System32\Tasks\MyTasks\prahar_ookla ( ECHO Automated task already scheduled.
							goto execute_batch 
							) 
if not exist (  set /P password=Enter password for %username% :
		schtasks /Create /RU %username% /RP %password% /SC MINUTE /MO 2 /TN MyTasks\prahar_ookla /TR C:\Users\%username%\Desktop\speedtest.exe
		if %ERRORLEVEL% EQU 0   goto execute_batch 
		if %ERRORLEVEL% NEQ 0 (	ECHO Please try again.
					goto create_task 
					)
		)





