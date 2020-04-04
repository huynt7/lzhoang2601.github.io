#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "SleepKey", 0)
{
#endif
    //External(_SB.LID, DeviceObj)
    //External(_SB.LID.XLID, MethodObj)
    External(_SB.LID0, DeviceObj)
    External(_SB.LID0.XLID, MethodObj)
    //External(_SB.PCI0.LPCB.LID, DeviceObj)
    //External(_SB.PCI0.LPCB.LID.XLID, MethodObj)
    //External(_SB.PCI0.LPCB.LID0, DeviceObj)
    //External(_SB.PCI0.LPCB.LID0.XLID, MethodObj)
    External (RMCF.SPFN, IntObj)

    Device(SLPK)
    {
        Name(_ADR, 0)
        Name(MYLD, 0)
        Method (_STA, 0, NotSerialized)
        {
            If (\RMCF.SPFN == 1)
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
    
    Scope (_SB.LID0)
    {
        Method (_LID, 0, NotSerialized)
        {
            Local0 = \SLPK._STA()
            If (Local0!=0)
            {
                Return (0)
            }
            Else
            {
                Return (\_SB.LID0.XLID())
            }
        }
    }
    
    //SleepKey_PNP0C0D(LID0)
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    External(_SB.PCI0.LPCB.EC.XLID, MethodObj)
    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q01, 0, NotSerialized)
        {
            Local0 = \SLPK._STA()
            If (Local0!=0)
            {
                If (\SLPK.MYLD!=0) { \SLPK.MYLD =0 }
                Else
                { \SLPK.MYLD =1 }
                Notify (\_SB.LID0, 0x80)
            }
            Else
            {
                \SLPK.MYLD =1
                \_SB.PCI0.LPCB.EC.XLID()
            }
        }
    } 
    
    //SleepKey for Dell laptop(BTNV)
    /*
    Scope (_SB)
    {
        Method (BTNV, 2, NotSerialized)
        {
            Local0 = \SLPK._STA()
            If (Local0!=0)
            {
                
                If (Arg0 == One) { Notify (\_SB.LID0, 0x80) }
            
                If (Arg0 == 2) 
                {
                    \SLPK.MYLD =0
                    Notify (\_SB.LID0, 0x80)
                }
        
                If (Arg0 == 3)
                {
                    \SLPK.MYLD =1
                    Notify (\_SB.LID0, 0x80)   
                }
            }
            Else
            {
                \SLPK.MYLD =1
                \_SB.XTNV()
            }
        }
    } 
    */
#ifndef NO_DEFINITIONBLOCK
}
#endif enable
//EOF