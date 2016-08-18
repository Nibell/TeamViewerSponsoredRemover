;	AutoHotkey Version: 1.x
;	Language:       English
;	Platform:       Windows 10
;	Author:         Linus Nibell
;
;	Script Function:
;	This script will detect when the TeamViewer "Sponsored Session: Thanks for playing fair!" message box pops up and 
;	close it automatically.
;
;	This script will run best when it is compiled and placed in the Windows startup folder.
;	You can find the startup folder for all users here:
;	WinXP: C:\Documents and Settings\All Users\Start Menu\Programs\Startup
;	Win 7,8,8.1,10: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup

#Persistent			; This keeps the script running permanently.
#NoTrayIcon			; Disables the tray icon. Must quit from task manager.
#SingleInstance		; Only allows one instance of the script to run.

;RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Teamviewer, "%A_ScriptFullPath%" ; Starts the Program on startup using the registry.

DetectHiddenWindows, on

WinWaitActive, Sponsored session, This was a free session sponsored by www.teamviewer.com. ;Wait for the sponsored session
{
	SendInput {Enter} ;Close it.  This window selects 'OK' by default.
	sleep, 100
	reload
}
