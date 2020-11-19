objectdef jmbsession
{
    method Initialize()
    {
        LavishScript:RegisterEvent[On Activate]
        LavishScript:RegisterEvent[OnWindowStateChanging]
        LavishScript:RegisterEvent[On3DReset]

        Event[On Activate]:AttachAtom[This:OnActivate]
        Event[OnWindowStateChanging]:AttachAtom[This:OnWindowStateChanging]
        Event[On3DReset]:AttachAtom[This:On3DReset]
    }

    method OnActivate()
    {
        WindowCharacteristics -pos -viewable 0,0 -size -viewable 1920x810 -frame none
        if !${Session.Equal[jmb1]}
            relay jmb1 "WindowCharacteristics -stealth -pos -viewable 0,810 -size -viewable 640x270"
        if !${Session.Equal[jmb2]}
            relay jmb2 "WindowCharacteristics -stealth -pos -viewable 640,810 -size -viewable 640x270"
        if !${Session.Equal[jmb3]}
            relay jmb3 "WindowCharacteristics -stealth -pos -viewable 1280,810 -size -viewable 640x270"
    }

    method On3DReset()
    {
        if !${Session.Equals["jmb${JMB.Slot}"]}
        {
            uplink name jmb${JMB.Slot}
            LGUI2.Element[test.mainVFXSource]:SetFeedName[jmb${JMB.Slot}]
        }
    }

    method OnWindowStateChanging(string change)
    {
        
    }
}

variable(global) jmbsession JMBSession

function main()
{
    echo test.Session.iss

    while 1
        waitframe
}