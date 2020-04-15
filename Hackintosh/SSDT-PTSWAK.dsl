// Overriding _PTS and _WAK

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "_PTSWAK", 0)
{
#endif
    External(ZPTS, MethodObj)
    External(ZWAK, MethodObj)
    External(DGPU._ON, MethodObj)
    External(DGPU._OFF, MethodObj)
    External(XWCF.MPWS, IntObj)
    External(XWCF.MYLD, IntObj)
    External(EISC, MethodObj)
    External(_SB.PCI0.XHC.PMEE, FieldUnitObj)
    External(_SI._SST, MethodObj)
    External(_SB.LID, DeviceObj)
    External(_SB.LID0, DeviceObj)
    External(_SB.PCI0.LPCB.LID, DeviceObj)
    External(_SB.PCI0.LPCB.LID0, DeviceObj)
    
    Device (TSWK)
    {
        Name (_ADR, 0)
        Name (SHUT, 0)
        Name (REST, 0)
        Name (WAKE, 0)
    }
    
    Method(_PTS, 1)
    {
        If (CondRefOf (\XWCF.MPWS))
        {
            If(\XWCF.MPWS == 1)
            {
                Arg0 = 3
            }
        }

        If (5 == Arg0)
        {
            If (\TSWK.SHUT == 1)
            {
                OperationRegion(PMRS, SystemIO, 0x000, 1)
                //search Processor...if DATA of CPU is 1810, set 0x1830
                //                   if DATA is 410, set 0x430....
                Field(PMRS, ByteAcc, NoLock, Preserve)
                {
                        , 4,
                    SLPE, 1,
                }
                SLPE =0
                Sleep(16)
            }
        }

        If (CondRefOf (\DGPU._ON))
        {
            \DGPU._ON ()
        }
        
        If (3 == Arg0)
        {
            If (CondRefOf (\EISC))
            {
                \EISC (0x81, 0x16, 0)//dell powerLED
            }
        }

        ZPTS(Arg0)

        If (5 == Arg0)
        {
            If (\TSWK.REST == 1) { If (CondRefOf(\_SB.PCI0.XHC.PMEE)) { \_SB.PCI0.XHC.PMEE = 0 }}//PMXX 
        }
        }
    
    Method(_WAK, 1)
    {
        If (CondRefOf (\XWCF.MPWS))
        {
            if(\XWCF.MPWS ==1)
            {
                \XWCF.MPWS =0
                Arg0 = 3
            }
        }
        
        If (CondRefOf (\XWCF.MYLD))
        {
            \XWCF.MYLD =1
        }
        
        If (Arg0 < 1 || Arg0 > 5) { Arg0 = 3 }

        Local0 = ZWAK(Arg0)

        If (CondRefOf (\DGPU._OFF))
        {
            \DGPU._OFF ()
        }

        If (3 == Arg0)
        {
            If (\TSWK.WAKE == 1)
            {
                If (CondRefOf (\_SB.LID))
                {
                    Notify (\_SB.LID, 0x80)
                }
                If (CondRefOf (\_SB.LID0))
                {
                    Notify (\_SB.LID0, 0x80)
                }
                If (CondRefOf (\_SB.PCI0.LPCB.LID))
                {
                    Notify (\_SB.PCI0.LPCB.LID, 0x80)
                }
                If (CondRefOf (\_SB.PCI0.LPCB.LID0))
                {
                    Notify (\_SB.PCI0.LPCB.LID0, 0x80)
                }
            }
            
            If (CondRefOf (\EISC))
            {
                \EISC (0x81, 0x16, 2)
            }
            If (CondRefOf(\_SI._SST)) { \_SI._SST (1) }
        }
        // return value from original _WAK
        Return (Local0) 
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF