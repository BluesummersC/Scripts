
^space:: Winset, Alwaysontop, , A


^r::
Reload
return


^p::
WinGet, wininfo, ID, A
WinGet, styleinfo, Style, A
WinGetClass, classinfo, A
WinGetTitle, wintitle, A
WinGet, processinfo, ProcessName, A

MsgBox, [Title:"%wintitle%";Class:"%classinfo%"]`nStyle="%styleinfo%`nProcess=%processinfo%`nPosX=1970
return
