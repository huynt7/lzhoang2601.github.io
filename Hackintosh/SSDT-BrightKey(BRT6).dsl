#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "BrightFN", 0)
{
#endif
    External (_SB_.PCI0.IGPU, DeviceObj)    
    External (_SB_.PCI0.IGPU.LCD_, DeviceObj)    
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    
    External (LCD_, UnknownObj)    

    Scope (_SB.PCI0.IGPU)
    {
        Method (BRT6, 2, NotSerialized) // Use rename (BrightKey) BRT6 to XRT6
        {
            If (LEqual (Arg0, One))
            {
                Notify (LCD, 0x86)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
            }

            If (And (Arg0, 0x02))
            {
                Notify (LCD, 0x87)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
