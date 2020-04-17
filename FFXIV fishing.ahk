#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;-----------------------------------------------------------------------------------------------------------------------------------

$6::
IfWinExist, FINAL FANTASY XIV
{
WinGetTitle, selectedWin, A

BlockInput On			
WinActivate, FINAL FANTASY XIV								
SENDINPUT, {6}
sleep 200
WinActivate, %selectedWin%
BlockInput Off

return
}
else
{
SENDINPUT, {6}
}

return

;-----------------------------------------------------------------------------------------------------------------------------------

$3::
IfWinExist, FINAL FANTASY XIV
{
WinGetTitle, selectedWin, A

BlockInput On			
WinActivate, FINAL FANTASY XIV								
SENDINPUT, {3}
sleep 200
WinActivate, %selectedWin%
BlockInput Off

return
}
else
{
SENDINPUT, {3}
}

return

;-----------------------------------------------------------------------------------------------------------------------------------

Joy1::
IfWinExist, FINAL FANTASY XIV
{
WinGetTitle, selectedWin, A

BlockInput On			
WinActivate, FINAL FANTASY XIV								
SENDINPUT, {1}
sleep 200
WinActivate, %selectedWin%
BlockInput Off
}
else
{
SENDINPUT, {1}
}

return
;-----------------------------------------------------------------------------------------------------------------------------------

Joy2::
IfWinExist, FINAL FANTASY XIV
{
WinGetTitle, selectedWin, A

BlockInput On			
WinActivate, FINAL FANTASY XIV								
SENDINPUT, {Numpad0}
sleep 200
WinActivate, %selectedWin%
BlockInput Off

return
}
else
{
SENDINPUT, {Numpad0}
}

return

;-----------------------------------------------------------------------------------------------------------------------------------

Joy3::
IfWinExist, FINAL FANTASY XIV
{
WinGetTitle, selectedWin, A

BlockInput On			
WinActivate, FINAL FANTASY XIV								
SENDINPUT, {3}
sleep 200
WinActivate, %selectedWin%
BlockInput Off

return
}
else
{
SENDINPUT, {3}
}

return

;-----------------------------------------------------------------------------------------------------------------------------------

Joy4::
IfWinExist, FINAL FANTASY XIV
{
WinGetTitle, selectedWin, A

BlockInput On			
WinActivate, FINAL FANTASY XIV								
SENDINPUT, {6}
sleep 200
WinActivate, %selectedWin%
BlockInput Off

return
}
else
{
SENDINPUT, {6}
}

return


;-----------------------------------------------------------------------------------------------------------------------------------

^r::
Reload 
Return
;-----------------------------------------------------------------------------------------------------------------------------------