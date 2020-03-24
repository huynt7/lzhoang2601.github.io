DefinitionBlock ("", "SSDT", 2, "ACDT", "AOACWake", 0)
{
    External (_SB.PCI0.LPCB.EC, DeviceObj)
    External (_SB.PCI0.LPCB.EC.XQ50, MethodObj)
    External (_SB.PCI0.LPCB.EC.LID0, DeviceObj)
    External (_SB.PCI8.AOAC, IntObj)

    Scope (_SB.PCI0.LPCB.EC)
    {
        //Fn+Q,Fn+space,LID,Fn+F4,Fn+F6,Fn+F7
        Method (_Q50, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                //...
                \_SB.PCI8.AOAC = One
                Notify (\_SB.PCI0.LPCB.EC.LID0, 0x80)
                Sleep (200)
                \_SB.PCI8.AOAC = Zero
                //...
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ50()
            }
        }
    }
}
//EOF