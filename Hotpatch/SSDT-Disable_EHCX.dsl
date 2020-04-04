DefinitionBlock ("", "SSDT", 2, "APPLE ", "EHCx_OFF", 0x00001000)
{
    External(RMCF.OEHC, MethodObj)
    Scope (\)
    {
        OperationRegion (RCRG, SystemMemory, 0xFED1F418, One)
        Field (RCRG, DWordAcc, Lock, Preserve)
        {
                ,   13, 
            EH2D,   1, 
                ,   1, 
            EH1D,   1
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            EH1D = One  // Disable EHC1
            EH2D = One  // Disable EHC2
        }
        
        Method (_STA, 0, NotSerialized)
            {
                If (\RMCF.OEHC == 1)
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
