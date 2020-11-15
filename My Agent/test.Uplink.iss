objectdef jmbcharacter
{
    method Initialize(jsonvalue jo)
    {

    }
}

objectdef jmblauncher
{
    variable collection:jmbcharacter Characters

    method Launch()
    {
        echo JMBLauncher:Launch
        ;execute -repeat 10 -reparse "open dxnothing \"dxnothing default profile\""

        variable int Slot
        for (Slot:Set[1] ; ${Slot}<=5 ; Slot:Inc)
        {
            This:LaunchSingleInstance[${Slot}]
        }

        timedcommand 50 JMBLauncher:ApplyWindowLayout
    }

    method LaunchSingleInstance(int Slot)
    {
        echo open DxNothing "DxNothing Default Profile" -startup "run \"${Script.CurrentDirectory}/test.SetSession.iss\" ${Slot}"
        open DxNothing "DxNothing Default Profile" -startup "run \"${Script.CurrentDirectory}/test.SetSession.iss\" ${Slot}"

    }

    method ApplyWindowLayout()
    {
        echo JMBLauncher:ApplyWindowLayout
        relay jmb1 "WindowCharacteristics -pos -viewable 0,0 -size -viewable 1920x840 -frame none"
        relay jmb2 "WindowCharacteristics -stealth -pos -viewable 0,840 -size -viewable 320x240 -frame none"
        relay jmb3 "WindowCharacteristics -stealth -pos -viewable 320,840 -size -viewable 320x240 -frame none"
        relay jmb4 "WindowCharacteristics -stealth -pos -viewable 640,840 -size -viewable 320x240 -frame none"
        relay jmb5 "WindowCharacteristics -stealth -pos -viewable 960,840 -size -viewable 320x240 -frame none"
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