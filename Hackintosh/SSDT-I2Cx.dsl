
DefinitionBlock ("", "SSDT", 2, "hack", "I2C", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2CX.XXXX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2CX.XXXX.SBFB, IntObj)    // (from opcode)
    External (_SB_.PCI0.I2CX.XXXX.SBFG, IntObj)    // (from opcode)
    External (_SB_.PCI0.I2CX.XXXX.SBFI, IntObj)    // (from opcode)
    External (OSYS, FieldUnitObj)    // (from opcode)
    External (SDM0, FieldUnitObj)    // (from opcode)

    Scope (_SB.PCI0.GPI0) 
    {
        Method (_STA, 0, NotSerialized) // Use rename (I2C) _STA to XSTA
        {
            Return (0x0F)
        }
    }

    Scope (_SB.PCI0.I2CX.XXXX)
    {
        /*
        Name (SBFG, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
            "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0000
            }
        })
        */
        
        Method (_CRS, 0, NotSerialized)  // Use rename (I2C) _CRS to XCRS
        {
            /*
            Name (XBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            
            Name (XBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   
                        0x0000
                    }
            })       
            
            Return (ConcatenateResTemplate (XBFB, XBFG))
            */    
            
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }
}

