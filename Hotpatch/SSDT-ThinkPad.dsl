//
// In config ACPI, KBD renamed PS2K
// Find:     4B42435F
// Replace:  5053324B
//
// Search "PNP0303"...
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "ThinkPad", 0)
{
#endif
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(RMCF.TKPD, IntObj)
    
    If (\RMCF.TKPD == 1)
    {
    Scope (_SB.PCI0.LPCB.PS2K)
    {
        //TP-Keyboard
        Method (_DSM, 4, Serialized)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Local0 = Package()
            {
                "RM,oem-id", 
                "LENOVO",
                "RM,oem-table-id", 
                "T460",//"T420","T560",...
            }
            Return (Local0)
        }
        
        Name (RMCF,Package() 
        {
            "Synaptics TouchPad", Package()//Patch RedPoint
            {
                "BogusDeltaThreshX", 400,
                "BogusDeltaThreshY", 350,
                "DivisorX",1,
                "DivisorY",1,
                "MomentumScrollThreshY", 7,
                "MultiFingerHorizontalDivisor", 1,
                "MultiFingerVerticalDivisor", 1,
                "Resolution", 2950,
                "ScrollDeltaThreshX", 10,
                "ScrollDeltaThreshY", 10,
                "ScrollResolution", 2950,
            }, 
            
            "Mouse", Package()//Enable Trackpad
            {
                "ActLikeTrackpad", ">y",
            },
        })
    }}
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
