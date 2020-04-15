#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "BrightFN", 0)
{
#endif
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    
    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q0E, 0, NotSerialized)  // Use rename (BrightKey) _Q0E to XQ0E
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
            Notify (\_SB.PCI0.LPCB.PS2K, 0x20)
        }
        
        Method (_Q0F, 0, NotSerialized)  // Use rename (BrightKey) _Q0E to XQ0E
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
            Notify (\_SB.PCI0.LPCB.PS2K, 0x10)
        }
        
        /*
        External(HKNO, FieldUnitObj)
        Method (_Q13, 0, NotSerialized) // Use rename (BrightKey) _Q13 to XQ13
        {
            Name (_T_0, Zero)
            While (One)
            {
                Store (HKNO, _T_0)
                If (LEqual (_T_0, 0x07))
                {
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x0406)
                    Notify(s\_SB.PCI0.LPCB.PS2K, 0x10)
                }
                ElseIf (LEqual (_T_0, 0x08))
                {
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x0405)
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x20)
                }
                Else{}
                Break
            }
        }
        */
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
