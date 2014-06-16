#NoEnv
#Persistent
#SingleInstance, Force
SetKeyDelay, 1, 1

If !A_IsCompiled
	Menu, Tray, Icon, %A_ScriptDir%\terminal.ico
Else
	Menu, Tray, Icon, %A_ScriptName%

; Set up a group of windows that are based on PuTTY
GroupAdd, PuTTYGroup, ahk_class PuTTY
GroupAdd, PuTTYGroup, ahk_class KiTTY
GroupAdd, PuTTYGroup, ahk_class FuTTY
GroupAdd, PuTTYGroup, ahk_class TuTTY
GroupAdd, PuTTYGroup, ahk_class PieTTY
GroupAdd, PuTTYGroup, ahk_class mintty
GroupAdd, PuTTYGroup, ahk_class WindowsForms10.Window.8.app.0.3ce0bb8
GroupAdd, PuTTYGroup, ahk_class PUTTYCS_WND_CLASS

;Not compatible with:
; MTPuTTY
; MobaXterm

!g:: ; ALT+g - Reload script
	Suspend, Permit
	Reload
Return

^!Enter::LoopPuTTY(1) ; CTRL+ALT+Enter - Bring all the PuTTY windows to the foreground

^!PgUp:: ; CTRL+ALT+PgUp
	Suspend, off ; Enable "Sync Typing mode"
	If (A_IsCompiled) {
		Menu, Tray, Icon, %A_ScriptFullPath%,1
	} else {
		Menu, Tray, Icon, %A_ScriptDir%\terminal.ico
	}
Return

^!PgDn:: ; CTRL+ALT+PgDn
	Menu, Tray, Icon, ,,1 ; Freeze the icon in order to hide the default Suspend icon
	Suspend, on ; Disable "Sync Typing mode"
	If (A_IsCompiled) {
		Menu, Tray, Icon, %A_ScriptFullPath%,4
	} else {
		Menu, Tray, Icon, %A_ScriptDir%\terminal-disabled.ico
	}
Return

#IfWinActive ahk_group PuTTYGroup ; Only execute if the active window is in the PuttyGroup
; Allow the following exceptions for system/application macros
~!Tab::Return     ; Switch windows
~#Tab::Return     ; Switch windows
~#u::Return       ; Usability tools
~#x::Return       ; Mobility Center
~^+ESC::Return    ; Open Task Manager
~#p::Return       ; Switch screen resolution
~#Left::Return    ; Windows shortcut
~#Right::Return   ; Windows shortcut
~#Up::Return      ; Windows shortcut
~#Down::Return    ; Windows shortcut
~#1::Return       ; Windows shortcut
~#2::Return       ; Windows shortcut
~#3::Return       ; Windows shortcut
~#4::Return       ; Windows shortcut
~#5::Return       ; Windows shortcut
~#6::Return       ; Windows shortcut
~#7::Return       ; Windows shortcut
~#8::Return       ; Windows shortcut
~#9::Return       ; Windows shortcut
~#0::Return       ; Windows shortcut
~#z::Return       ; Launchy
~#a::Return       ; Putty Connection Manager
~#n::Return       ; New PuTTY Window
~#q::Return       ; Microsoft Lync
~#y::Return       ; Microsoft Lync 2013
~^+i::Return      ; AutoGTD
~^!k::Return      ; KeePass
~^!a::Return      ; KeePass Autotype
~!+a::Return      ; KeePass Autotype
~^+-::Return      ; VPN External
~^+=::Return      ; VPN Internal
+INS::Paste()     ; Paste to all PuTTY Windows
^v::
	;Suspend, Permit
	Paste()
Return

; Special Exceptions for CTRL commands
^c::
^d::
^l::
^r::
^g::
^x::
^]::
	LoopPuTTY(0,1)
Return

; Capture hotkeys with SHIFT held down
+0::
+1::
+2::
+3::
+4::
+5::
+6::
+7::
+8::
+9::
+a::
+b::
+c::
+d::
+e::
+f::
+g::
+h::
+i::
+j::
+k::
+l::
+m::
+n::
+o::
+p::
+q::
+r::
+s::
+t::
+u::
+v::
+w::
+x::
+y::
+z::
+=::
+-::
+[::
+]::
|::
+'::
+`::
+,::
+.::
+/::
+`;::
LoopPuTTY(0,0,1)
Return

; Configure the general keyboard as hotkeys and capture them without modifiers
0::
1::
2::
3::
4::
5::
6::
7::
8::
9::
a::
b::
c::
d::
e::
f::
g::
h::
i::
j::
k::
l::
m::
n::
o::
p::
q::
r::
s::
t::
u::
v::
w::
x::
y::
z::
*Space::
*Left::
*Right::
*Up::
*Down::
*Backspace::
=::
-::
+::
[::
]::
\::
`;::
'::
*Enter::
`::
*Tab::
.::
,::
/::
*Delete::
*Home::
*End::
*PgUp::
*PgDn::
*ESC::
LoopPuTTY(0)
Return

LoopPuTTY(Focus=0, CTRL=0, SHIFT=0)
{
	WinGet, WinList, List, ahk_group PuTTYGroup ; Get a list of all PuTTY windows
	Loop %WinList% ; Loop through the list
	{
		If (Focus == 1)
		{
			WinActivate, % "ahk_id " . WinList%A_Index% ; Focus on each window
		}
		If (CTRL=0 AND SHIFT=0)
		{
			ControlSend, , % "{" RegExReplace(A_ThisHotkey, "[*$~]") "}", % "ahk_id " WinList%A_Index% ; Send the key
		} else {
			ControlSend, , %A_ThisHotkey%, % "ahk_id " WinList%A_Index% ; Send the key
			Send, {CTRL UP}{SHIFT UP}
			Sleep 5
		}
	}
}
#IfWinActive

; Send to all PuTTY Windows Safely
Paste()
{
	If (A_IsSuspended==0)
	{
		; Not Suspended.  Send clipboard to all windows
		WinGet, puttyWindows, List, ahk_group PuTTYGroup
		Loop %puttyWindows%
		{
			SetKeyDelay, -1
			ControlSend, , %clipboard%, % "ahk_id " . puttyWindows%A_Index%
			SetKeyDelay, 1, 1
		}
	} else {
		; Suspended. Just paste to current window
		Send, %clipboard%
	}
}
