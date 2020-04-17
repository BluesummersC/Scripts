#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Persistent
BlockInput Off


^l::
Loop {
if (breakLoop = 1)
   break

WinGetTitle, currentTitle, A
MouseGetPos, mouse_x, mouse_y

BlockInput On
WinActivate, Dragon’s Dogma: Dark Arisen
Send {E}
sleep 100

WinActivate, %currentTitle%
MouseMove, %mouse_x%, %mouse_y%

BlockInput Off
sleep 3500
}

Esc::
breakLoop = 1
BlockInput Off
return

^Tab::
breakLoop = 0
BlockInput Off
return
