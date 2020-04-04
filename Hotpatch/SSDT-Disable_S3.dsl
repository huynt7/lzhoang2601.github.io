DefinitionBlock("", "SSDT", 2, "ACDT", "__S3", 0)
{
    External (RMCF.DBS3, IntObj)
    If (\RMCF.DBS3 == 0)
    {
        //
    }
    Else
    {
        Name (_S3, Package (0x04)
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }
}