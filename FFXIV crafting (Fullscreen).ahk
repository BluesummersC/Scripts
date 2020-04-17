#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


!t::

SENDINPUT {Enter}
sleep 300
SENDINPUT Enter How many times you want to craft and then hit Enter
sleep 300
Input, craftN, , {Enter}

sleep 300
deletechatbox()
sleep 300
SENDINPUT Enter How many macros keys you are using and then hit Enter
sleep 300
Input, macroN, , {Enter}


loop, %macroN%
{

	deletechatbox()
	sleep 300
	SENDINPUT Use a modifier macro%A_Index% 0=None 1=Shift 2=Control 3=Alt (type number then hit Enter)
	sleep 300
	Input, mod%A_Index%, , {Enter}
	
	if mod%A_Index% <> 0
	{ 
			if mod%A_Index% <> 1
			{
				if mod%A_Index% <> 2
				{
					if mod%A_Index% <> 3
					{
						deletechatbox()
						Sendinput Invalid Character Entered. Aborting.
						Return
					}
				}
			}
	}

	deletechatbox()
	sleep 300
	SENDINPUT Press the key for macro%A_Index% and then hit Enter
	sleep 300
	Input, macro%A_Index%, , {Enter}

	deletechatbox()
	sleep 300
	SENDINPUT How long to wait after pressing (macro%A_Index%)? seconds
	sleep 300
	Input, wait%A_Index%, , {Enter}
	deletechatbox()
	
}	 

sleep 500
SENDINPUT {Escape}
sleep 2000

loop, %craftN%					;Change Number to how many times you want it to loop
{

			SENDINPUT {Numpad0}			;Selects the Item to craft
			Sleep 1000				;Waits 1 second
			SENDINPUT {Numpad0}			;Selects "Synthesis" button
			Sleep 4000				;Waits 4 seconds

			loop, %macroN%
			{
			
			if (mod%A_Index% = 3){
			SENDINPUT {Alt Down}
			} 
			if (mod%A_Index% = 2){
			SENDINPUT {Control Down}
			}
			if (mod%A_Index% = 1){
			SENDINPUT {Shift Down}
			}
		
			;SENDINPUT {Control Down}		;Pushes the Ctrl button. Remove if not needed
		
			Sleep 300
			SEND % macro%A_Index%				;This is the Key the first Macro is on.
			sleep 300
		
			SENDINPUT {Control Up}
			SENDINPUT {Shift Up}	
			SENDINPUT {Alt Up}

			SLEEP % Wait%A_Index% * 1000
	
			}


			SENDINPUT {Enter}
			sleep 300
			deletechatbox()
			sleep 300
			SENDINPUT Finished %A_Index% of %craftN%!
			sleep 300
			SENDINPUT {Esc}
			sleep 500

}


Return

;-----------------------------------------------------------------------------------------------------------------------------------

deletechatbox()
{

	SENDINPUT {Shift Down}
	sleep 300
	SENDINPUT {Home}
	sleep 300
	SENDINPUT {Shift Up}
	sleep 300
	SENDINPUT {Delete}
	
}

;-----------------------------------------------------------------------------------------------------------------------------------