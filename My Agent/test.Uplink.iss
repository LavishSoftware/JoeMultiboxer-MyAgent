objectdef jmblauncher
{
    method Initialize()
    {
        This:InstallCharacters
    }

    method InstallCharacters()
    {
        variable jsonvalue jo
        jo:SetValue["$$>
        {
            "id":1,
            "display_name":"WoW Classic",
            "game":"WoW Classic",
            "gameProfile":"WoW Classic Default Profile"
        }
        <$$"]
        JMB:AddCharacter["${jo.AsJSON~}"]
    }

    method Launch()
    {
        echo JMBLauncher:Launch

        JMB:ClearSlots
        

        variable int Slot
        for (Slot:Set[1] ; ${Slot}<=3 ; Slot:Inc)
        {
            JMB:AddSlot
            JMB.Slot[${Slot}]:SetCharacter[1]
            JMB.Slot[${Slot}]:Launch
        }

        timedcommand 30 JMBLauncher:AssignGlobalHotkeys
    }

    method ApplyWindowLayout()
    {
        echo JMBLauncher:ApplyWindowLayout
        relay all "WindowCharacteristics -pos -viewable 0,0 -size -viewable 1920x810 -frame none"
;        relay jmb2 "WindowCharacteristics -stealth -pos -viewable 640,810 -size -viewable 640x270"
;        relay jmb3 "WindowCharacteristics -stealth -pos -viewable 1280,810 -size -viewable 640x270"
        /*
        relay jmb1 "WindowCharacteristics -pos -viewable 0,0 -size -viewable 1920x840 -frame none"
        relay jmb2 "WindowCharacteristics -stealth -pos -viewable 0,840 -size -viewable 320x240 -frame none"
        relay jmb3 "WindowCharacteristics -stealth -pos -viewable 320,840 -size -viewable 320x240 -frame none"
        relay jmb4 "WindowCharacteristics -stealth -pos -viewable 640,840 -size -viewable 320x240 -frame none"
        relay jmb5 "WindowCharacteristics -stealth -pos -viewable 960,840 -size -viewable 320x240 -frame none"
        */
    }

    method AllFullScreen()
    {
        relay all "WindowCharacteristics -pos -viewable 0,0 -size -viewable 1920x1080 -frame none"
    }

    method AssignGlobalHotkeys()
    {
        relay jmb1 "globalbind focus \"ctrl+alt+1\" windowvisibility foreground"
        relay jmb2 "globalbind focus \"ctrl+alt+2\" windowvisibility foreground"
        relay jmb3 "globalbind focus \"ctrl+alt+3\" windowvisibility foreground"
    }

    method ShowConsoles()
    {
        relay all "LGUI2.Element[consoleWindow]:SetVisibility[Visible]"
    }

    method CloseAll()
    {
        echo JMBLauncher:CloseAll
        relay all exit
    }
}

variable(global) jmblauncher JMBLauncher

function main()
{
    while 1
        waitframe
}