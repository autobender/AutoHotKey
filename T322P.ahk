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
InputBox, leverandor, T322P, `n0nsker du leverandor?`n`n24 = Gerry Weber`n171 = GW Edition`n14 = Taifun
if ErrorLevel
	MsgBox, Du avbroyt prossessen.
else
{
	InputBox, sesong, T322P, `nHvilken sesong onsker du?`n 0151 = K1`n 0152 = K2
	if ErrorLevel
	    MsgBox, Du avbroyt prossessen.
	else
	{
		InputBox, split, T43P, `nHvilken split 0nsker du? (skriv tall)`n 1 Artikkel`n 2 Artikkel farge`n 3 Art. Farge Str`n 4 Sesong`n 5 Varegruppe
		if ErrorLevel
		    MsgBox, Du avbroyt prossessen.
		else
		{
			InputBox, layout, T322P, `nHvilken layout ønsker du?`n 1 Uten BF   2 Med BF`n 3 Avvik mot opptalt      4 Sesong`n 5 Varegruppe
			if ErrorLevel
			    MsgBox, Du avbroyt prossessen.
			else
			{
				InputBox, dato, T322P, `nSkriv inn 0nsket beholdningsdato:`n`nBlank = dagens dato`n(DD.MM.YY)
				if ErrorLevel
				    MsgBox, Du avbroyt prossessen.
				else
				{   
			    	;Kjøres antall butikker.
					Loop 2
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
								;Hvis split = sesong må layout også være sesong
								if split = 4
								{
									layout = 4
								}
								;Hvis split er varegruppe må layout også være varegruppe
								if split = 5
								{
									layout = 5
								}
								WinActivate
								;Sett Putty som aktivt vindu
								Sleep 1000
								;1 sekund pause
								Send T322P`n
								Sleep 100
								Send `n
								;Send skriver
								Sleep 100
								Send %skriver%`n
								Sleep 100
								;Send butikk
								Send `n
								Sleep 100
								;Send Fra varegruppe
								Send `n
								Sleep 100
								;Send til varegruppe
								Send `n
								Sleep 100
								;Send avdeling
								Send `n
								Sleep 100
								;Send sesong
								Send %sesong%`n
								Sleep 100
								;Send leverandor
								Send %leverandor%`n
								Sleep 100
								;Send beholdningsdato
								Send %dato%`n
								Sleep 100
								;Send split
								Send %split%`n
								Sleep 100
								;send layout
								Send %layout%`n
								Sleep 3000
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
				; Slutt dato else
				}
			;Slutt layout Else
			}
		;Slutt split Else
		}
	;Slutt sesong Loop
	}
;Slutt Leverandør valg
}