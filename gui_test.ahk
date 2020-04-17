Gui, font, s10, Verdana
Gui, Add, Text, x22 y19 w320 h40 , Is this a Collectible Craft?
Gui, Add, Button, x22 y69 w100 h30 vYes, Yes
Gui, Add, Button, x132 y69 w100 h30 vNo, No
Gui, Add, Button, x242 y69 w100 h30 vCancel, Cancel
; Generated using SmartGUI Creator 4.0
Gui, Show,, Collectible?
Return

GuiClose:
ExitApp