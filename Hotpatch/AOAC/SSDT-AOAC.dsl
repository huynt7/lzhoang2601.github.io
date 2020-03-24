// AOAC
// In config ACPI, _LID to XLID
// Find:     5F4C4944 00
// Replace:  584C4944 00
//
DefinitionBlock("", "SSDT", 2, "ACDT", "AOAC", 0)
{
    External(_SB.LID, DeviceObj)
    External(_SB.LID.XLID, MethodObj)
    External(_SB.LID0, DeviceObj)
    External(_SB.PCI0.LPCB.EC.LID, DeviceObj)
    External(_SB.PCI0.LPCB.EC.LID0, DeviceObj)
    External(_SB.LID0.XLID, MethodObj)
    External(_SB.PCI0.LPCB.EC.LID.XLID, MethodObj)
    External(_SB.PCI0.LPCB.EC.LID0.XLID, MethodObj)
    
    Scope (_SB)
    {
        Device (PCI8)
        {
            Name (_ADR, Zero)
            Name (AOAC, Zero)
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
    }
    
    If (CondRefOf (\_SB.LID))
    {    
        Scope (_SB.LID)
        {
            Method (_LID, 0, NotSerialized)
            {
                If ((_OSI ("Darwin") && (\_SB.PCI8.AOAC == One)))
                {
                    Return (One)
                }
                Else
                {
                    Return (\_SB.LID.XLID())
                }
            }
        }
    }
    
    If (CondRefOf (\_SB.LID0))
    {    
        Scope (_SB.LID0)
        {
            Method (_LID, 0, NotSerialized)
            {
                If ((_OSI ("Darwin") && (\_SB.PCI8.AOAC == One)))
                {
                    Return (One)
                }
                Else
                {
                    Return (\_SB.LID0.XLID())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.LPCB.EC.LID))
    {    
        Scope (_SB.PCI0.LPCB.EC.LID)
        {
            Method (_LID, 0, NotSerialized)
            {
                If ((_OSI ("Darwin") && (\_SB.PCI8.AOAC == One)))
                {
                    Return (One)
                }
                Else
                {
                    Return (\_SB.PCI0.LPCB.EC.LID.XLID())
                }
            }
        }
    }
    
    If (CondRefOf (\_SB.PCI0.LPCB.EC.LID0))
    {    
        Scope (_SB.PCI0.LPCB.EC.LID0)
        {
            Method (_LID, 0, NotSerialized)
            {
                If ((_OSI ("Darwin") && (\_SB.PCI8.AOAC == One)))
                {
                    Return (One)
                }
                Else
                {
                    Return (\_SB.PCI0.LPCB.EC.LID0.XLID())
                }
            }
        }
    }
}
//EOF