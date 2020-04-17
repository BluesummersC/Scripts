
^o:: ; Button to start script. '^' = ctrl | '+' = shift | '!' = alt

StopLoop := "False"
Loop
{
    ControlSend, , {F12}, FINAL FANTASY XIV  ; Target Placard 
    Sleep, 300
    ControlSend, , {Numpad0}, FINAL FANTASY XIV  ; Interact with Palcard
    Sleep, 500
    ControlSend, , {Numpad0}, FINAL FANTASY XIV  ; Purchase Land
    Sleep, 500
    ControlSend, , {Numpad0}, FINAL FANTASY XIV  ; Private Individual
    Sleep, 500
    ControlSend, , {Numpad4}, FINAL FANTASY XIV  ; Move cursor left once
    Sleep, 600
    ControlSend, , {Numpad4}, FINAL FANTASY XIV  ; Confirm
    Sleep, 500
	
    If StopLoop = True
    {
        Break
    }
}
~Esc:: 
  StopLoop := True 
return

^r::
	ExitApp
return
