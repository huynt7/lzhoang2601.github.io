#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "Sleep", 0)
{
#endif
    External(_SB.LID0, DeviceObj)
    External(_SB.LID0.XLID, MethodObj)
    External(_SB.PCI0.LPCB.LID0, DeviceObj)
    External(_SB.PCI0.LPCB.LID0.XLID, MethodObj)
    External(XWCF.MYLD, IntObj)
    Device(XWCF)
    {
        Name(_ADR, 0)
        Name(MYLD, 1)
        Name(MPWS, 0)
        //
        Name(MODE, 0)
        //0:PNP0C0D
        //1:PNP0C0E
        //
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
    
    If (CondRefOf (\_SB.LID0))
    {
        Scope (_SB.LID0)
        {
            Method (_LID, 0, NotSerialized)
            {
                if(\XWCF.MYLD==0)
                {
                    Return (0)
                }
                Else
                {
                    Return (\_SB.LID0.XLID())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.LPCB.LID0))
    {
        Scope (_SB.PCI0.LPCB.LID0)
        {
            Method (_LID, 0, NotSerialized)
            {
                if(\XWCF.MYLD==0)
                {
                    Return (0)
                }
                Else
                {
                    Return (\_SB.PCI0.LPCB.LID0.XLID())
                }
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif enable
//EOF