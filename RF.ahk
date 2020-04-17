
^/::
RFtoggle = 1
return

+/::
BenToggle = 1
return

^.::
RFtoggle = 0
return

+.::
BenToggle = 0
return

~5::
RFtoggle = 0
return

~LButton::
if RFtoggle = 1
{ 
  Loop 
  { 
    SetMouseDelay 65 
    Click 
    If (GetKeyState("LButton","P")=0) 
    Break 
  }
}
if BenToggle = 1
{
	sleep 500
	send {r}
	sleep 500
	send LButton

}
return

^r::
reload
return

'::
ExitApp