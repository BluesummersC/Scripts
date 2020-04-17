#ifWinActive The Chronicles of Spellborn


; ------- Click the loot all button --------
g::  ; Using "g", but change to whatever you want
sendinput {r}	; Disable mouselook
sleep 200
MouseMove, 2480, 1010
sleep 100
mouseclick, left
sleep 100
sendinput {r}	; Reenable mouselook
Return

; ------- Put the mouse right back to where you clicked --------
~f::
WeaponDrawn := !WeaponDrawn
Return

~r::
MouseLookActive := !MouseLookActive
Return

~LButton::
MouseGetPos, mouseX, mouseY
Return
~LButton Up::
If (!WeaponDrawn and !GetKeyState("LShift", "P") and !MouseLookActive){
	If (!GetKeyState("RButton", "P")){
		; This is so you can still use both mousebuttons to move without getting whiplash
		MouseMove, mouseX, mouseY 
		}
	}
Return

~RButton::
MouseGetPos, mouseX, mouseY
Return
~RButton Up::
If (!WeaponDrawn and !MouseLookActive){
	If (!GetKeyState("LButton", "P")){
		; This is so you can still use both mousebuttons to move without getting whiplash
		MouseMove, mouseX, mouseY 
		}
	}
Return

+r::
Reload
Return



