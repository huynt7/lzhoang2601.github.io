
DefinitionBlock("", "SSDT", 2, "ACDT", "AOAC", 0)
{
    //External(_SB.LID, DeviceObj)
    //External(_SB.LID.XLID, MethodObj)
    //External(_SB.PCI0.LPCB.EC.LID, DeviceObj)
    //External(_SB.PCI0.LPCB.EC.LID0, DeviceObj)
    External(_SB.LID0, DeviceObj)
    External(_SB.LID0.XLID, MethodObj)
    //External(_SB.PCI0.LPCB.LID.XLID, MethodObj)
    //External(_SB.PCI0.LPCB.LID0.XLID, MethodObj)
    External(RMCF.A0AC, MethodObj)
    
    //Use rename (Sleep) _LID to XLID
    Scope (_SB)
    {
        Device (SAOA)
        {
            Name (_ADR, Zero)
            Name (AOAC, Zero)
            Method (_STA, 0, NotSerialized)
            {
                If (\RMCF.A0AC == 1)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
 
    Scope (_SB.LID0)
    {
        Method (_LID, 0, NotSerialized)
        {
            If (\_SB.SAOA.AOAC == One)
            {
                Return (One)
            }
            Else
            {
                Return (\_SB.LID0.XLID())
            }
        }
    }

    External (_SB.PCI0.LPCB.EC, DeviceObj)
    External (_SB.PCI0.LPCB.EC.XQ08, MethodObj)
    External (_SB.PCI0.LPCB.EC.LID0, DeviceObj)
    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q08, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                //...
                \_SB.SAOA.AOAC = One
                Notify (\_SB.PCI0.LPCB.EC.LID0, 0x80)
                Sleep (200)
                \_SB.SAOA.AOAC = Zero
                //...
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ08()
            }
        }
    }
    
    /*
    //Use rename (SleepKey) BTNV to XTNV
    External (_SB.XTNV, MethodObj)
    Scope (_SB)
    {
        Method (BTNV, 2, NotSerialized)
        {
            If ((_OSI ("Darwin") && (Arg0 == 0x02)))
            {
                //...
                \_SB.SAOA.AOAC = One
                Notify (\_SB.LID0, 0x80)
                Sleep (200)
                \_SB.SAOA.AOAC = Zero
                //...
            }
            Else
            {
                \_SB.XTNV (Arg0, Arg1)
            }
        }
    }
    */
}
//EOF