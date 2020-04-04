
DefinitionBlock ("", "SSDT", 2, "hack", "I2CxConf", 0x00000000)
{
    External (_SB_.PCI0.I2C0, DeviceObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (FMD0, FieldUnitObj)
    External (FMD1, FieldUnitObj)
    External (FMH0, FieldUnitObj)
    External (FMH1, FieldUnitObj) 
    External (FML0, FieldUnitObj)
    External (FML1, FieldUnitObj)
    External (PKG3, MethodObj)    // 3 Arguments
    External (SSD0, FieldUnitObj)
    External (SSD1, FieldUnitObj)
    External (SSH0, FieldUnitObj)
    External (SSH1, FieldUnitObj)
    External (SSL0, FieldUnitObj)
    External (SSL1, FieldUnitObj)
    External (RMCF.I2CF, IntObj)
    
    If (\RMCF.I2CF == 1)
    {
    Method (PKGX, 3, Serialized)
    {
        Name (PKG, Package (0x03)
        {
            Zero, 
            Zero, 
            Zero
        })
        PKG [Zero] = Arg0
        PKG [One] = Arg1
        PKG [0x02] = Arg2
        Return (PKG) /* \PKGX.PKG_ */
    }

    Scope (_SB.PCI0.I2C0)
    {
        Method (SSCN, 0, NotSerialized)
        {
            Return (PKGX (SSH0, SSL0, SSD0))
        }

        Method (FMCN, 0, NotSerialized)
        {
            Return (PKGX (FMH0, FML0, FMD0))
        }
    }

    Scope (_SB.PCI0.I2C1)
    {
        Method (SSCN, 0, NotSerialized)
        {
            Return (PKGX (SSH1, SSL1, SSD1))
        }

        Method (FMCN, 0, NotSerialized)
        {
            Return (PKGX (FMH1, FML1, FMD1))
        }
    }}
}

