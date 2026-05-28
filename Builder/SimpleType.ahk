#SingleInstance Force

configFile := A_ScriptDir "\keybinds.ini"

if !FileExist(configFile) {
    IniWrite, F6, %configFile%, gmail, key
    IniWrite, @gmail.com, %configFile%, gmail, text
    IniWrite, F5, %configFile%, microsoft, key
    IniWrite, @microsoft.com, %configFile%, microsoft, text
}

IniRead, gmailKey, %configFile%, gmail, key
IniRead, gmailText, %configFile%, gmail, text
IniRead, msKey, %configFile%, microsoft, key
IniRead, msText, %configFile%, microsoft, text

MsgBox, Use F2 and Win key to get into settings

SetHotkeys()
return

SetHotkeys() {
    global gmailKey, gmailText, msKey, msText
    Hotkey, #%gmailKey%, GmailAction, On
    Hotkey, #%msKey%, MicrosoftAction, On
}

GmailAction:
Send %gmailText%
return

MicrosoftAction:
Send %msText%
return

#F2::
global gmailKey, gmailText, msKey, msText, configFile
Gui, Destroy
Gui, New
Config := A_ScriptDir "\Settings.ini"

IniRead, TextColour, %Config%, Text, TextColour
IniRead, AppName, %Config%, Text, Name
StringReplace, TextColour, TextColour, #,, All
if (TextColour != "ERROR")
    Gui, Font, c%TextColour%

IniRead, BMGIMG, %Config%, BMG, BMGIMG
if (BMGIMG = "Null" || BMGIMG = "ERROR") {
    IniRead, BNG, %Config%, BNG, BNG
    StringReplace, BNG, BNG, #,, All
    if (BNG != "ffffff" && BNG != "ERROR") {
        Gui, Color, %BNG%
    }
} else {
    Gui, Add, Picture, w200 h200, %BMGIMG%
}

Gui, Add, Text,, Gmail Key:
Gui, Font, cDefault
Gui, Add, Edit, vGKey w150, %gmailKey%
Gui, Font, c%TextColour%
Gui, Add, Text,, Gmail Text:
Gui, Font, cDefault
Gui, Add, Edit, vGText w150, %gmailText%
Gui, Font, c%TextColour%
Gui, Add, Text,, Microsoft Key:
Gui, Font, cDefault
Gui, Add, Edit, vMKey w150, %msKey%
Gui, Font, c%TextColour%
Gui, Add, Text,, Microsoft Text:
Gui, Font, cDefault
Gui, Add, Edit, vMText w150, %msText%
Gui, Font, c%TextColour%
Gui, Add, Button, gSaveSettings w120, Save
if (AppName != "ERROR")
    Gui, Show, autosize, %AppName%
else
    Gui, Show, autosize, Keybind Settings
return

SaveSettings:
Gui, Submit
IniWrite, %GKey%, %configFile%, gmail, key
IniWrite, %GText%, %configFile%, gmail, text
IniWrite, %MKey%, %configFile%, microsoft, key
IniWrite, %MText%, %configFile%, microsoft, text
Reload
return
