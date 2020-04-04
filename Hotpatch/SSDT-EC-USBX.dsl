DefinitionBlock ("", "SSDT", 2, "ACDT", "ECX", 0x00001000)
{
    External(RMCF.ECUX, IntObj)
    Scope (\_SB)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (\RMCF.ECUX == 1)
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
        
        Device (EC)
        {
            Name(_HID, "EC000000")
        }
        
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply",
                    0x13EC,
                    "kUSBSleepPortCurrentLimit",
                    0x0834,
                    "kUSBWakePowerSupply",
                    0x13EC,
                    "kUSBWakePortCurrentLimit",
                    0x0834
                })
            }
        }
    }
}
