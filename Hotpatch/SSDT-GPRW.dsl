DefinitionBlock ("", "SSDT", 2, "ACDT", "GPRW", 0)
{
    External(XPRW, MethodObj)
    External(RMCF.PRWG, IntObj)
    Method (GPRW, 2, NotSerialized)
    {
        If (\RMCF.PRWG == 1)
        {
            If ((0x6D == Arg0))
            {
                Return (Package ()
                {
                    0x6D, 
                    Zero
                })
            }

            If ((0x0D == Arg0))
            {
                Return (Package ()
                {
                    0x0D, 
                    Zero
                })
            }
        }
        Return (XPRW (Arg0, Arg1))
    }
}

