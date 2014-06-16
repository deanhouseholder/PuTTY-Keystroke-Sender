PuTTY Keystroke Sender
===================


Description:
------------------

PuTTY Keystroke Sender is a tool that allows you to control all of your PuTTY terminal windows at the same time.  It allows you to type character-by-character in every window simultaneously.  Many Systems Administrators will recognize the value of needing to do the same thing to many servers at once.  You can even still use tab-complete or vim a file in interactive mode (which no other command sender can do).


Instructions:
-------------------

You can either run the PuTTYKeystrokeSender.exe file.  The script is entirely portable so you need to set up your own auto startup shortcut.  Refer to this site for instructions:

http://windows.microsoft.com/en-us/windows/run-program-automatically-windows-starts#1TC=windows-7

If you prefer not to use the included .exe file you can install AutoHotkey and run the .ahk file directly.  You can also compile it yourself.


Hotkeys:
--------------

**CTRL+ALT+Enter** – Focus all PuTTY windows (useful, when buried behind another window)

**CTRL+ALT+PgDn** – Temporarily deactivate sending to all terminals and allows you to focus on just one

**CTRL+ALT+PgUp** – Resume sending to all terminals


Changelog:
-----------------

22 Sept, 2012
Version 1.0 released

16 June, 2014
Version 1.1 released
* Added MinTTY support
* Added Paste to all support


Features requested:
-------------------------------

* Change the hotkey mappings
* Offer an installable version
* Easy way to auto-start
* Hotkey to bring all PuTTY windows to the foreground
