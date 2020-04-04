
DefinitionBlock ("", "SSDT", 2, "hack", "I2C", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.GPI0.XSTA, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.I2Cx.XXXX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2Cx.XXXX.SBFB, IntObj)    // (from opcode)
    External (_SB_.PCI0.I2Cx.XXXX.SBFG, IntObj)    // (from opcode)
    External (_SB_.PCI0.I2Cx.XXXX.SBFI, IntObj)    // (from opcode)
    External (OSYS, FieldUnitObj)    // (from opcode)
    External (SDM0, FieldUnitObj)    // (from opcode)
    External (RMCF.I2CX, IntObj)

    Scope (_SB.PCI0.GPI0)
    {
        Method(_STA, 0, NotSerialized)
        {
            If (\RMCF.I2CX == 1)
            {
                Return (0x0F)
            }
            Else
            {
                Return (\_SB.PCI0.GPI0.XSTA())
            }
        }
    }

    Scope (_SB.PCI0.I2Cx.XXXX)
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
        
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            /*
            Name (XBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2Cx",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            
            Name (XBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake,,,)
                {
                    0x00000027
                }
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
    }}
}

