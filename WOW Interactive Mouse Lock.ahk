#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive World of Warcraft
screen_x = %A_ScreenWidth%
screen_y = %A_ScreenHeight%

Hotkey, ~r, Off

~+b::
Hotkey, ~r, toggle
return

~r::
toggle = 0
while GetKeyState("r", "p")
{
	Send {r down}
	if toggle = 0
	{
		sleep 10
		MouseMove, screen_x/2, screen_y/2
		toggle = 1
	}
}
r_up()

return

r_up()
{
Send {r down}
MouseClick, left
Sleep 200
MouseClick, right
Sleep 100
Send {r up}
}