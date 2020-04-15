#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "I2CxBUS", 0x00001000)
{
#endif
    External(_SB_.PCI0.I2C0, DeviceObj)
    External(_SB_.PCI0.I2C1, DeviceObj)
    
    Scope (_SB.PCI0.I2C0) //Use rename (I2C) I2C0: _STA to XSTA
    {    
        Method (_STA, 0, NotSerialized)
        {
            Return (0)
        }
    }
    
    Scope (_SB.PCI0.I2C1) //Use rename (I2C) I2C1: _STA to XSTA
    {    
        Method (_STA, 0, NotSerialized)
        {
            Return (0)
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF