#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.


SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive FINAL FANTASY XIV



!p::
	endlessLoop := 1
	while(endlessLoop){
		BlockInput On
		WinActivate, FINAL FANTASY XIV
		SENDINPUT {SPACE}
		BlockInput Off
		fProgressBar()
	}
	
return

!o::
	endlessLoop := 0
	Gui, Destroy
return

fProgressBar()
{
	global
	iWaitTimeSeconds := 60
	iWaitTime := iWaitTimeSeconds * 1000
	iHundreth := iWaitTime / 100
	
	Gui 3:Default
	Gui, 3: +AlwaysOnTop
	Gui, Font, s10, Verdana
	Gui, Add, Progress, x10 y10 w300 h20 vIndex%iWaitTime% c00C6FF BackgroundBBBBBB
	Gui, Add, Text, x10 y10 w300 h20 +0x200 cFFFFFF +Center +BackgroundTrans vFile, Waiting %iWaitTime% seconds
	Gui, Show, AutoSize NoActivate , Wait before jump

	loop, 100
	{
		if (endlessLoop){
			GuiControl,, Index%iWaitTime%, % A_Index
			GuiControl,, File, Waiting %iWaitTimeSeconds% seconds
		}
		else{
			break
		}
		sleep 1000
	}

	Gui, Destroy
	return
}

return
