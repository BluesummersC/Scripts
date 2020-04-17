
; IF NOT A_IsAdmin { Run *RunAs "%A_ScriptFullPath%" ExitApp }

;#IFWINACTIVE Destiny 2
;~RButton::
;Send {F7}
;return
;#IF

~^space::
Winset, Alwaysontop, , A
Return

^r::
Reload
Return

#IFWINACTIVE Steam
Hotkey, Joy13, Something, On
Return
Something:
Return
#IF

#IFWINACTIVE FINAL FANTASY XIV
; Set my keybind of "Target last Target" to Alt+k
~RButton UP::
if (toggle) {
	SENDINPUT {Alt Down}
	AltIsDown := GetKeyState("Alt")
	if (AltIsDown) {
		Send K
	}
	Sleep 10
	SENDINPUT {Alt Up}
}
return

!j:: ; Alt+j will toggle it on and off
toggle:=!toggle
return
#IF

^!space::
SENDINPUT {space}
sleep 25
SENDINPUT {space}
return
