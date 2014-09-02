#SingleInstance, force

    overwrite := false
    base_url  := "http://netrunnerdb.com"
    root      := "Cards"

; =============================================

    FileCreateDir ..\%root%\Corp
    FileCreateDir ..\%root%\Runner

    Tooltip Downloading cards.json..., 0,0
    UrlDownloadToFile, %base_url%/api/cards, ..\%root%\cards.json
    Tooltip
    FileRead, json, ..\%root%\cards.json


    j := i := k := e:= 0, err:=""
    loop {
        k++
        j := RegExMatch(json,"O){.+?}", match, j+1)
        if (j == 0)
            break
        card := match.Value(0)
        if (card == "")
            continue

        title   := GetItem(card, "title")
        type    := GetItem(card, "type")
        side    := GetItem(card, "side")
        setname := GetItem(card, "setname")
        faction := GetItem(card, "faction")

        imagesrc      := GetItem(card, "imagesrc")
        largeimagesrc := GetItem(card, "largeimagesrc")

        img_url := largeimagesrc != "" ? largeimagesrc : imagesrc
        img_url = %base_url%%img_url%
        fn = %setname% - %faction% - %type% - %title%
        if (fn == "-  -  -") {
            err = %err%`n %k%: %fn% | %img_url%
            continue
        }

        card_path = ..\%root%\%side%\%fn%.png
        Tooltip Downloading %k%: %fn%, 0, 0
        if !overwrite && !FileExist(card_path)
        {
            UrlDownloadToFile, %img_url%, %card_path%
            dwn_err := ErrorLevel
            if FileExist(card_path)
                FileRead, _, %card_path%

            if (dwn_err || InStr(_, "<html>")) {
                if FileExist(card_path)
                    FileDelete %card_path%
                err = %err%`n %k%: %fn% | %img_url%
                e++
            }
        }
    }

    log = Download finished for %k% cards. This message is saved in download.log file. `nErrors (%e%):`n`n%err%
    FileDelete ..\%root%\download.log
    FileAppend %log%, ..\%root%\download.log
    Msgbox %log%
return

GetItem(json, name) {
    re = O)(?<="%name%":").*?[^\\](?=")
    RegExMatch(json, re, match)
    v := match.Value(0)
    if (v == """,") {
        return ""
    }
    StringReplace, v, v, :, %A_Space%-, A
    StringReplace, v, v, \, , A
    StringReplace, v, v, ",', A
    StringReplace, v, v, *, , A

    return v
}

