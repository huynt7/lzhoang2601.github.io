// AOAC
// IORegistryExplorer
// IOService:/AppleACPIPlatformExpert/IOPMrootDomain:
// IOPMDeepIdleSupported = true
// IOPMSystemSleepType = 7
// PMStatusCode = ?
//
DefinitionBlock("", "SSDT", 2, "ACDT", "DIDLE", 0)
{
    External(RMCF.DPIE, MethodObj)
    Scope (_SB)
    {
        Method (LPS0, 0, NotSerialized)
        {
            If (\RMCF.DPIE == 1)
            {
                Return (0x0B)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
    
    Scope (_GPE)
    {
        Method (LXEN, 0, NotSerialized)
        {
            If (\RMCF.DPIE == 1)
            {
                Return (0x0B)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}