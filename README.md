PuTTY Keystroke Sender
===================


Description:
------------------

PuTTY Keystroke Sender is a tool that allows you to control all of your PuTTY terminal windows at the same time.  It allows you to type character-by-character in every window simultaneously.  Many Systems Administrators will recognize the value of needing to do the same thing to many servers at once.  You can even still use tab-complete or vim a file in interactive mode (which no other command sender can do).


Download:
------------------
Go to the [Releases tab](https://github.com/deanhouseholder/PuTTY-Keystroke-Sender/releases).


How to Run:
-------------------

Just run the PuTTYKeystrokeSender.exe file.  You will notice the new terminal icon in your system tray.  The script is entirely portable so you need to set up your own auto startup shortcut.  Refer to this site for instructions:

http://windows.microsoft.com/en-us/windows/run-program-automatically-windows-starts

If you prefer not to use the included .exe file you can install AutoHotkey and run the .ahk file directly.  You can also compile it yourself.


Usage Instructions:
-------------------

Upon opening a PuTTY window, you will notice that the title is changed to include a **[0]** at the end.  This signifies that PuTTY Keystroke Sender has detected this new window and assigned it to a default group of 0.  Keystrokes typed in a window of a given group go to every window in that group.  If I open four PuTTY windows I can now send keystrokes to one window and have it replicate to each of the other three.

Now, let's say that I want to open another PuTTY window but the work I need to do on it is short-term.  I want to type to it and not the other 4.  There are a few ways of doing this:<br />

1.  You can press CTRL+ALT+PgDn to temporarily disable replicating keystrokes, do your work, close that window and press CTRL+ALT+PgUp again to resume sending to all 4 windows. OR<br />

2.  You can assign the 4 previous windows to group 1.  To do this, press CTRL+ALT+1 on each one, the group will change to 1 and the title will show **[1]**.

Now you can resume typing to the new window and the previous group of four windows will continue to work together.

While no PuTTY windows are focused, pressing CTRL+ALT+0-9 will bring that group of windows to the focus.


Hotkeys:
--------------

**CTRL+ALT+Home** – Focus all PuTTY windows (useful, when buried behind another window)<br />
**CTRL+ALT+PgDn** – Temporarily deactivate sending to all terminals and allows you to focus on just one<br />
**CTRL+ALT+PgUp** – Resume sending to all terminals<br />
**CTRL+ALT+0** - Add PuTTY windows to group 0<br />
**CTRL+ALT+1** - Add PuTTY windows to group 1<br />
**CTRL+ALT+2** - Add PuTTY windows to group 2<br />
**CTRL+ALT+3** - Add PuTTY windows to group 3<br />
**CTRL+ALT+4** - Add PuTTY windows to group 4<br />
**CTRL+ALT+5** - Add PuTTY windows to group 5<br />
**CTRL+ALT+6** - Add PuTTY windows to group 6<br />
**CTRL+ALT+7** - Add PuTTY windows to group 7<br />
**CTRL+ALT+8** - Add PuTTY windows to group 8<br />
**CTRL+ALT+9** - Add PuTTY windows to group 9<br />
**ALT+g** - Restart PuTTY Keystroke Sender (if it starts misbehaving)

Changelog:
-----------------

7 August 2015<br />
Version 2.1

* Fixed: Restarts don't reset groups to 0.

2 August 2015<br />
Version 2.0 - The fork of the fork of this project :)

> Backstory: Daniel Prokscha, an excellent AHK developer forked PuTTY Keystroke Sender, calling it [cPuTTY](https://github.com/dprokscha/cputty), and significantly rewrote much of it.  In later versions he also added group support.  I stayed using my original project for one main reason: by default Daniel's project couldn't send keystokes to new windows automatically after he added groups.  I have re-forked his version as it was significantly better in keystroke capture and sending, and added the following enhancements:

* Fixed by cPuTTY: Many broken key combinations such as ALT+b and ALT+f
* Fixed by cPuTTY: Slowness when sending keystrokes to several windows
* Fixed by cPuTTY: Capitalization keystroke sending problems
* Added: Paste to all windows with mouse middle-click or CTRL+v
* Added: Add groups with windows defaulting to group 0
* Added: Change title of PuTTY window to reflect group number
* Added: Modify to show icon enabled/disabled
* Added: Set all ungrouped windows to group 0
* Added: Paste with middle-click
* Added: Allow mintty
* Added: Alt-g to reload
* Added: Give a default message for resetting groups

7 August, 2014<br />
Version 1.2 released<br />
* Fixed slowness problem when typing to many terminals

16 June, 2014<br />
Version 1.1 released<br />
* Added MinTTY support
* Added Paste to all support

22 Sept, 2012<br />
Version 1.0 released


Features requested:
-------------------------------

* Change the hotkey mappings
* Offer an installable version
* Easy way to auto-start

