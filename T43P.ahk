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
InputBox, leverandor, T43P, `nSkriv inn leverandor`n`n24 = Gerry Weber`n171 = GW Edition`n14 = Taifun
if ErrorLevel
	MsgBox, Du avbroyt prossessen.
else
{
	InputBox, sesong, T43P, `nHvilken sesong onsker du?`n 0151 = K1`n 0152 = K2
	if ErrorLevel
	    MsgBox, Du avbroyt prossessen.
	else
	{
		InputBox, linje, T43P, Hvilken linje ønsker du?`n 1 Leverandor   2 Hovedvaregruppe`n 3 Varegruppe   4 Modell`n 5 Mod Farge    6 Mod Frg Str`n 7 Farge           8 Str`n 9 Modell Str
		if ErrorLevel
		    MsgBox, Du avbroyt prossessen.
		else
		{
			InputBox, sortertEn, T43P, `nHvilken sortering ønsker du?`n 0 Ingen`n 1 Stigende`n 2 Synkende
			if ErrorLevel
			    MsgBox, Du avbroyt prossessen.
			else
			{
				InputBox, sortertTo, T43P, `nHvilken sortering ønsker du?`n 1 Ant solgt   2 Salg i kr`n 3 BF i kr      4 BF i prosent`n 5 Ant kjopt    6 Omlophastighet`n 7 Beholdning 8 Dekningstall
				if ErrorLevel
				    MsgBox, Du avbroyt prossessen.
				else
				{
					InputBox, fraDato, T43P, `nSkriv inn fra dato:`n`n(DD.MM.YY)
					if ErrorLevel
					    MsgBox, Du avbroyt prossessen.
					else
					{   
						InputBox, tilDato, T43P, `nSkriv inn til dato:`n`n(DD.MM.YY)
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
											Send T43P`n
											Sleep 100
											Send `n
											Sleep 100
											Send `n
											Sleep 100
											Send %leverandor%`n
											Sleep 100
											Send `t
											Sleep 100
											Send `n
											Sleep 100
											Send `n
											Sleep 100
											;Modell
											Send `n
											Sleep 100
											;Sesong
											Send %sesong%`n
											Sleep 100
											;Send butikk
											Send %A_Index%`n
											Send `n
											Sleep 100
											Send `n
											Sleep 100
											Send `n
											Sleep 100
											Send `n
											Sleep 100
											Send %fraDato%`n
											Sleep 100
											Send %tilDato%`n
											Sleep 100
											Send %linje%`n
											Sleep 100
											Send %sortertEn%`n
											Sleep 100
											Send %sortertTo%`n
											Sleep 200
											Send %skriver%`n
											Sleep 300	
										}
										;Hvis Putty ikke er åpent.
										else
										{
											MsgBox, Du maa aapne Putty f0rst.
											Break
										}
									;Slutt Putty loop
									}
								;Slupp butikk Loop
								}
							;Slutt til dato Else
							}
					; Slutt fra dato else
					}
				;Slutt sortertTo Else
				}
			;Slutt sortertEn Else
			}
		;Slutt Linje valg
		}
	;Slutt sesong Loop
	}
;Slutt Leverandør valg
}