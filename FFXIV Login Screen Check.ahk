
F2::

Coordmode, pixel, screen
EndLoop = 0


Mylabel:
StartScreen()
CharacterScreen()
ErrorScreen()
IF (Endloop = "0")
{
	goto Mylabel
}

Return

;----------------------------------------------------------------------
StartScreen()
{
	PixelGetColor, start, 935, 618, Slow

	If(start = "0xEFF3F2")
	{
		SENDINPUT {Numpad0}
		Return
	}
	else
	{
		Sleep 500
		StartScreen()
	}
}
;-----------------------------------------------------------------------
CharacterScreen()
{
	PixelGetColor, character, 1484, 137, Slow

	If(character = "0xBCD752")
	{
		SendInput {Numpad0}
		Sleep 700
		SendInput {Numpad0}
		Return
	}
	else
	{
		Sleep 500
		CharacterScreen()
	}
}
;-----------------------------------------------------------------------
ErrorScreen()
{
	
	Sleep 2000	
	iterate = 0
	
	
	PixelGetColor, fukerror, 1168, 624, Slow

	If(fukerror = "0x30BEEE")
	{
		Sleep 500
		SendInput {Numpad0}
		Return
	}
	else if(fukerror = "0x195F77")
	{		
		Sleep 500
		ErrorScreen()
	}
	else
	{
		iterate = iterate + 1

		if(iterate = 5)
		{
			EndLoop = 1
			Return
		}
		else
		{
			ErrorScreen()
		}
	}
}
;-----------------------------------------------------------------------


;======================================================================

^z::

Coordmode, pixel, screen
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, Slow
Msgbox The Color at %MouseX%, %MouseY% is %color%

Return

;======================================================================

^r::

Reload

Return

;======================================================================

z::

CoordMode, Pixel, Screen
PixelGetColor, color, 1168, 624, Slow
MsgBox Color is %color%

Return

;=====================================================================

^x::

loop, 6
{
	SENDINPUT {Numpad0}
	Sleep 1000
	SENDINPUT {Numpad0}
	Sleep 3000
	SENDINPUT {Control Down}
	Sleep 300
	SENDINPUT {0}
	sleep 300
	SENDINPUT {Control Up}
	SLEEP 15000
	SENDINPUT {Control Down}
	Sleep 300
	SENDINPUT {-}
	Sleep 300
	SENDINPUT {Control Up}
	SLEEP 13000
}

return

;=====================================================================

^q::

SENDINPUT {Control Down}
SENDINPUT {0}
SENDINPUT {Control Up}

Return
