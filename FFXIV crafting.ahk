#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.


SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive FINAL FANTASY XIV

;Global Variables
aSize := 0
statusN := 1
firstTime := 1

;-----------------------------------------------------------------------------------------------------------------------------------

!a::	;Pushing alt+a will start the macro. Change to whatever you want. "^" means ctrl, "+" for shift, "!" for alt or just the key

if (firstTime = 0) {
	Gosub, sRepeat			;Prompt to use the last set of macros and wait times
	
}
while (waitingstate)
		sleep 100	
if (firstTime = 1) {
	firstTime := 0
	Gosub, sMacroNumber		;Get Number of Macros

	loop, %macroN%
	{
		Gosub, sModifier		;Get Modifier key
		Gosub, sMacroKey		;Get Macro Key
		Gosub, sWaitTime		;Get Wait Time after pressing Macro
	}	
}

Gosub, sCraftNumber		;Get How many times to craft
Gosub, sCollectible		;For Collectibles, as they require an additional key press at the end
while (waitingstate)
	sleep 100


;=====BEGIN CRAFTING LOOP=====
loop, %craftN%
{
			BlockInput On
			WinActivate, FINAL FANTASY XIV

			SENDINPUT {Numpad0}			;Selects the window
			Sleep 500					;Waits .5 second
			SENDINPUT {Numpad0}			;Selects the Item to craft
			Sleep 500					;Waits .5 second
			SENDINPUT {Numpad0}			;Selects "Synthesis" button
			BlockInput Off
			Sleep 2000					;Waits 2 seconds to crouch down
			
			loop, %macroN%
			{
				BlockInput On			
				WinActivate, FINAL FANTASY XIV								
	
				if (mod%A_Index% = 3){
					SENDINPUT {Alt Down}
				} 
				if (mod%A_Index% = 2){
					SENDINPUT {Control Down}
				}
				if (mod%A_Index% = 1){
					SENDINPUT {Shift Down}
				}
		
				Sleep 300
				SEND % macro%A_Index%
				Sleep 300
		
				SENDINPUT {Control Up}
				SENDINPUT {Shift Up}	
				SENDINPUT {Alt Up}
				
				BlockInput Off
				
				;SplashTextOn, 200, 50, Crafting, Crafting %statusN% of %craftN% 
				fProgressBar(macroN, statusN, A_Index)
				;SetTimer, Off, % Wait%A_Index% * 1000
				;Sleep % Wait%A_Index% * 1000
			}
			
			if (collect = 1){
				BlockInput On
				WinActivate, FINAL FANTASY XIV
				Sleep 500
				SENDINPUT {Numpad0}
				Sleep 500
				BlockInput Off
				}
	
			statusN := statusN + 1
			Sleep 2000
}

MsgBox, Finished!
statusN := 1
return

;-----------------------------------------------------------------------------------------------------------------------------------

sRepeat:
{
	Gui 2:-MinimizeBox -MaximizeBox
	Gui, font, s9, Verdana
	Gui, Add, Text, x22 y19 w220 h40 , Would you like to craft more using the same key(s) and wait time(s)?
	Gui, Add, Button, x22 y69 w50 h25 gRepeatYes, &Yes
	Gui, Add, Button, x132 y69 w50 h25 gRepeatNo Default, &No
	waitingstate := true
	Gui, Show,, Repeat?
	Return
	
	RepeatYes:
	{
		Gui, Destroy
		firstTime := 0
		waitingstate := false
	}
	return
		
	RepeatNo:
	{
		Gui, Destroy
		firstTime := 1
		waitingstate := false
	}
	return
	
	2GuiClose:
	Reload	

}
;-----------------------------------------------------------------------------------------------------------------------------------

sMacroNumber:
{
	InputBox, macroN, Number of Macros, How many Macros will you be using?, , 200, 180
	if ErrorLevel
	{
		MsgBox, CANCEL was pressed
		Reload
	}
Return
}

;-----------------------------------------------------------------------------------------------------------------------------------

sModifier:
{
	InputBox, mod%A_Index%, Use Modifier?, Use a modifier key for macro #%A_Index%? `n0=None `n1=Shift `n2=Control `n3=Alt, ,  300, 200
	if ErrorLevel
	{
		MsgBox, CANCEL was pressed
		Reload
	}

	if mod%A_Index% <> 0
	{ 
			if mod%A_Index% <> 1
			{
				if mod%A_Index% <> 2
				{
					if mod%A_Index% <> 3
					{
						MsgBox, Invalid Character Entered
						Reload
					}
				}
			}
	}
Return
}
;-----------------------------------------------------------------------------------------------------------------------------------

sMacroKey:
{
	InputBox, macro%A_Index%, Macro Key #%A_Index%, Enter the key for Macro #%A_Index%, , 200, 180
	if ErrorLevel
	{
		MsgBox, CANCEL was pressed
		Reload
	}
Return
}
;-----------------------------------------------------------------------------------------------------------------------------------

sWaitTime:
{
	InputBox, wait%A_Index%, Wait #%A_Index%, How many seconds to wait after pressing the macro(macro%A_Index%)?, , 200, 180
	if ErrorLevel
	{
		MsgBox, CANCEL was pressed
		Reload
	}

aSize = %A_Index%
Return
}
;-----------------------------------------------------------------------------------------------------------------------------------

sCraftNumber:
{
	InputBox, craftN, Craft Amount, How many times do you want to craft?, , 200, 180
	if ErrorLevel
	{
		MsgBox, CANCEL was pressed
		Reload
	}
Return
}
;-----------------------------------------------------------------------------------------------------------------------------------

sCollectible:
{
	Gui 1:-MinimizeBox -MaximizeBox
	Gui, font, s9, Verdana
	Gui, Add, Text, x12 y9 w160 h70 , Is there a Collectible prompt at the end?
	Gui, Add, Button, x12 y109 w55 h26 gCollectYes, &Yes
	Gui, Add, Button, x122 y109 w55 h26 gCollectNo Default, &No
	waitingstate := true
	Gui, Show, h145 w189, Collectible?
	Return
	
	CollectYes:
	{
		Gui, Destroy
		collect = 1
		waitingstate := false
	}
	return
		
	CollectNo:
	{
		Gui, Destroy
		collect = 0
		waitingstate := false
	}
	return
	
	GuiClose:
	Reload

Return
}
;-----------------------------------------------------------------------------------------------------------------------------------

fProgressBar(macroN, statusN, MacroC)
{
global
iWaitTime := 0
iWaitTime += Wait%A_Index%
iWaitTime *= 1000 
iHundreth := iWaitTime / 100
Gui 3:Default
Gui, 3: +AlwaysOnTop
Gui, Font, s10, Verdana
Gui, Add, Progress, x10 y10 w300 h20 vIndex%macroN% c00C6FF BackgroundBBBBBB
Gui, Add, Text, x10 y10 w300 h20 +0x200 cFFFFFF +Center +BackgroundTrans vFile, Macro %macroC% of %macroN%
Gui, Add, Text, x10 y+2 w300 h20 +0x200 c000000 +Center +BackgroundTrans, Crafting %statusN% of %craftN%
Gui, Show, AutoSize NoActivate , Crafting Progress

loop, 100
{
    GuiControl,, Index%macroN%, % A_Index
	GuiControl,, File, Macro %macroC% of %macroN%
    sleep %iHundreth%
}
Gui, Destroy
return
}

;-----------------------------------------------------------------------------------------------------------------------------------

Off:
SplashTextOff
Return
;-----------------------------------------------------------------------------------------------------------------------------------

!p::
SENDINPUT {Numpad0}
Return
;-----------------------------------------------------------------------------------------------------------------------------------

!o::
SEND {NumpadEnter}
Return
;----------------------------------------------------------------------------------------------------------------------------------

^r::
firstTime = TRUE
Reload 
Return
;-----------------------------------------------------------------------------------------------------------------------------------