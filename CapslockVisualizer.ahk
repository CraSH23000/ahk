;Set Onscreen Visual Display when Capslock is toggled

; Example: On-screen display (OSD) via transparent window:

GoSub, MakeGUI
return

MakeGUI:
CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
CapslockOn := GetKeyState("Capslock", "T")
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s12  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cLime, Capslock
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 150
SetTimer, UpdateOSD, 200
Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.

IniRead, xPos, CapslockVisualizer.ini, Capslock Splash Location, xLocation
IniRead, yPos, CapslockVisualizer.ini, Capslock Splash Location, yLocation

Gui, Show, x%xPos% y%yPos% NoActivate  ; NoActivate avoids deactivating the currently active window.
return

UpdateOSD:
GuiControl,Show%CapslockOn%, MyText, Capslock
return

~Capslock::
sleep, 150
CapslockOn := GetKeyState("Capslock", "T")
return

^Capslock::
CoordMode, Mouse, Screen

MouseGetPos, xPos, yPos
xPos -= 15
yPos -= 15

IniWrite, %xPos%, CapslockVisualizer.ini, Capslock Splash Location, xLocation
IniWrite, %yPos%, CapslockVisualizer.ini, Capslock Splash Location, yLocation
Gui, Show, x%xPos% y%yPos% NoActivate
return