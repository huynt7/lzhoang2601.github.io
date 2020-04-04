
DefinitionBlock ("", "SSDT", 2, "hack", "I2CxSRP", 0x00000000)
{
    External (_SB_.PCI0.I2C0, DeviceObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C2, DeviceObj)
    External (_SB_.PCI0.I2C3, DeviceObj)
    External (RMCF.I2CP, IntObj)
    
    If (\RMCF.I2CP == 1)
    {
    Scope (_SB.PCI0.I2C0)
    {
        Name (SSCN, Package () { 432, 507, 30 }) 
        Name (FMCN, Package () { 72, 160, 30 }) 
    }

    Scope (_SB.PCI0.I2C1)
    {
        Name (SSCN, Package () { 528, 640, 30 }) 
        Name (FMCN, Package () { 128, 160, 30 }) 
    }
    
    Scope (_SB.PCI0.I2C2)
    {
        Name (SSCN, Package () { 432, 507, 30 }) 
        Name (FMCN, Package () { 72, 160, 30 }) 
    }
    
    Scope (_SB.PCI0.I2C3)
    {
        Name (SSCN, Package () { 432, 507, 30 }) 
        Name (FMCN, Package () { 72, 160, 30 }) 
    }
    }
}

