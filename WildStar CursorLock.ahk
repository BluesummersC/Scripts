#ifWinActive WildStar 14764

~9::mouselook()

mouselook()
{
MouseMove, 2930, 540
static Toggle
SetTimer, MouseCheck, % (Toggle:=!Toggle) ? 50 : "off"
return
}

MouseCheck:
MouseGetPos, MouseX, MouseY
If MouseX > 3800
{
	Send {9}
	MouseMove, 0, 500
	Send {9}
}
Return

^r::
Reload
return

Pause::
ExitApp