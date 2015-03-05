;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Escape::
ExitApp
Return
^!c::
skriver := 100
InputBox, fraDato, T48, `nSkriv inn fra dato:`n`n(DD.MM.YY)
if ErrorLevel
    MsgBox, Du avbroyt prossessen.
else
{   
	InputBox, tilDato, T48, `nSkriv inn til dato:`n`n(DD.MM.YY)
	if ErrorLevel
	    MsgBox, Du avbrøyt prossessen.
	else
	    {
	    	;Kjøres antall butikker.
			Loop 27
			{
			; Øker skriver med en. I tråd med butikknummer
			skriver += 1
				;Hopp over butikk 6
				if skriver = 106
				{}
				;Hopp over butikk 9
				else if skriver = 109
				{}
				;Hopp over butikk 10
				else if skriver = 110
				{}
				else{
					;Hvis putty eksisterer kjør disse kommandoene
					IfWinExist 10.252.1.20 - PuTTY
					{
						WinActivate
						;Sett Putty som aktivt vindu
						Sleep 1000
						;1 sekund pause
						Send T48`n
						Sleep 200
						Send %skriver%`n
						Sleep 200
						Send %A_Index%`n
						Sleep 200
						Send %fraDato%`n
						Sleep 200
						Send %tilDato%`n

					}
					;Hvis Putty ikke er åpent.
					else
					{
						MsgBox, Du maa aapne Putty f0rst.
						Break
					}
				;Slutt Putty loop
				}
			;Slupp Loop
			}
		;Slutt andre Else
		}
; Slutt første else
}