function SetSessionName(int Slot)
{
    variable int Count=1
    if ${Slot}>0
        Count:Set[${Slot}]

	if ${Session[jmb${Count}]}
	{
		wait 10
	}
    do
    {
      do
      {
        Uplink Name jmb${Count}
        WaitFor "Session name 'jmb${Count}' accepted" "Session name 'jmb${Count}' rejected" 50
      }
      while ${WaitFor}==0

        if ${WaitFor}==2
            continue

	  SessionNumber:Set[${Count}]

      if ${WaitFor}==1
	  {
		  return
	  }
    }
    while "${Count:Inc}<1000"	
}


function main(int Slot)
{
    echo test.SetSession.iss ${Slot}
    call SetSessionName ${Slot}
}