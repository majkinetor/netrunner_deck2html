root := "Cards"
img1 := img3 := ""
loop, ..\%root%\*.png, , 1
{
    img = <img src="%A_LoopFileFullPath%">
    img1 .= img
    img3 .= img img img
}

fn = Netrunner-1.htm
html := Html(1)
FileDelete, %fn%
FileAppend, %html%, %fn%

fn = Netrunner-3.htm
html := Html(3)
FileDelete, %fn%
FileAppend, %html%, %fn%


Html(no) {
    global
    imgs := no==1 ? img1 : img3
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
