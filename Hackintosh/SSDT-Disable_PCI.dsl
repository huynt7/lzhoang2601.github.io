DefinitionBlock ("", "SSDT", 2, "ACDT", "DPCI", 0)
{
    External (_SB.PCI0.RP05, DeviceObj)
    External (RMCF.DPCI, IntObj)

    If (\RMCF.DPCI == 1)
    {
        Scope (_SB.PCI0.RP05)
        {
            OperationRegion (DE01, PCI_Config, 0x50, 1)
            Field (DE01, AnyAcc, NoLock, Preserve)
            {
                    ,   1, 
                    ,   3, 
                DDDD,   1
            }
        }
    
        Scope (\)
        {
            \_SB.PCI0.RP05.DDDD = One
        }
    }
}
//EOF