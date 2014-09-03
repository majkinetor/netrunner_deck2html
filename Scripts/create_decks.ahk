
	d := ""
	loop, ..\Decks\*.txt
	{
		deck := A_LoopFileName


		root := "Cards"
		imgs := "", k := j:=0
		loop, read, ..\Decks\%deck%
		{
			no := SubStr(A_LoopReadLine, 1, 1), card := Trim(SubStr(A_LoopReadLine, 3))
			if no is not integer
				continue
			k++, j += no

			cp := GetCardFileName( card )
			i = <img src="%cp%">
			while (no > 0)
			{
				imgs .= i
				no--
			}
		}

		StringReplace, fnH, deck, .txt, .htm
		html := Html()
		FileDelete, ..\Decks\%fnH%
		FileAppend, %html%, ..\Decks\%fnH%

		;StringReplace, fnP, deck, .txt, .pdf
		;RunWait, ..\Utils\wkhtmltopdf\wkhtmltopdf.exe --page-width 150 --page-height 200 -O Landscape "..\Decks\%fnH%" "..\Decks\%fnP%"

		 d .= "`n" deck " (" j " cards, " k " unique)"
	}
	Msgbox Deck's created: `n %d%
return

GetCardFileName( Name ) {
    global deck
    static init := 0, cards := ""

    if (!init) {
        init++
        loop, ..\%root%\*.png, , 1
            cards .= "`n" A_LoopFileFullPath
    }

    re = m`n)^.*\Q%Name%\E.*$
    i := RegExMatch(cards, re, out)
    return out
}



Html() {
    global

r =
(LTrim
    <html>
    <head>
        <style>
            img {
                width  : 63.5mm;
                height : 88mm;
            }
        </style>
    </head>
    <body>
        %imgs%
    </body>
    </html>
)
    return r
}
