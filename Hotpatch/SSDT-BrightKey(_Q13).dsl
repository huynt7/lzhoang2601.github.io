#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "BrightFN", 0)
{
#endif
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(HKNO, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q13, 0, NotSerialized) //path:_SB.PCI0.LPCB.EC._Q13
        {
            Name (_T_0, Zero)
            While (One)
            {
                Store (HKNO, _T_0)
                If (LEqual (_T_0, 0x07))
                {
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x0406)
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x10)
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
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
