Gui, Font, s10, Verdana
Gui, Add, Progress, x10 y10 w300 h20 vIndex c00C6FF BackgroundBBBBBB
Gui, Add, Text, x10 y10 w300 h20 +0x200 cFFFFFF +Center +BackgroundTrans vText , 1 of 100
Gui, Add, Text, x10 y+2 w300 h20 +0x200 c000000 +Center +BackgroundTrans vFile 
Gui, Show, AutoSize , Crafting Progress

loop, 100
{
    GuiControl,, Index, % A_Index
    GuiControl,, File, % A_Index
    GuiControl,, Text, % A_Index " of 100"
    sleep 10
}
return

GuiEscape:
   ExitApp