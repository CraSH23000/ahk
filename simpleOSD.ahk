#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Arg 1 is displayed text
;Arg 2 is Font size

CustomColor := "EEAA99"
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, %CustomColor%
Gui, Font, s%2%
Gui, Add, Text, vMyText cLime, %1%
WinSet, TransColor, %CustomColor% 150

Gui, Show, NoActivate
gui_id := WinExist()
WinGetPos,,,w,, ahk_id %gui_id%
x += %A_ScreenWidth%
x += %w%

Gui, Show, NoActivate
gui_id := WinExist()
WinGetPos,,,,h, ahk_id %gui_id%
y += %A_ScreenHeight%
y += %h%

return

LButton::
ExitApp
return