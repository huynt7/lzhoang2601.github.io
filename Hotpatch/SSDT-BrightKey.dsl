#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "BrightFN", 0)
{
#endif
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    External(_SB.PCI0.LPCB.EC.XQ0E, MethodObj)
    External(_SB.PCI0.LPCB.EC.XQ0F, MethodObj)
    External(RMCF.BNFN, IntObj)
    
    Scope (_SB.PCI0.LPCB.EC)
    {
        If (LEqual (\RMCF.BNFN, One))
        {
            Method (_Q0E, 0, NotSerialized)  // _Qxx: EC Query
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x20)
            }
        }

        If (LEqual (\RMCF.BNFN, One))
        {
            Method (_Q0F, 0, NotSerialized)  // _Qxx: EC Query
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x10)
            }
        }
    }
    #ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
