#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "RMCF", 0)
{
#endif
    Device(RMCF)
    {
        Name(_ADR, 0)
        
        //0: Off
        //1: On
        Name(ALS, 1)//SSDT-ALS0
        Name(A0AC, 1)//SSDT-A0AC
        Name(BNFN, 1)//SSDT-BrightKey
        Name(BNFT, 1)//SSDT-BrightKey(_Q13)
        Name(BNFD, 1)//SSDT-BrightKey(BRT6)
        Name(DPIE, 1)//SSDT-DeepIdle
        Name(TGPU, 1)//SSDT-Disable_DGPU
        Name(I2CB, 0)//SSDT-Disable_I2CxBus
        Name(DPCI, 1)//SSDT-Disable_PCI
        Name(DBS3, 1)//SSDT-Disable_S3
        Name(ADMA, 0)//SSDT-DMAC PNP0200
        Name(ECUX, 0)//SSDT-EC-USBX
        Name(OEHC, 0)//SSDT-Disable_EHCX
        Name(USBP, 0)//SSDT-UIAC
        Name(I2CL, 0)//SSDT-I2CSKL
        Name(I2CX, 1)//SSDT-I2Cx
        Name(I2CF, 0)//SSDT-I2CxConf
        Name(I2CP, 0)//SSDT-I2CxSRP
        Name(FLAN, 0)//SSDT-LAN
        Name(LPCP, 1)//SSDT-LPC
        Name(ACHC, 0)//SSDT-MCHC 
        Name(AMEM, 0)//SSDT-MEM2 PNP0C01
        Name(PLUG, 1)//SSDT-PLUG
        Name(APMC, 1)//SSDT-PMCR
        Name(BNLF, 1)//SSDT-PNLF
        Name(APPM, 0)//SSDT-PPMC 0x001F0002
        Name(PSWK, 1)//SSDT-PTSWAK
        Name(SHUT, 0)//SSDT-PTSWAK
        Name(RUSB, 0)//SSDT-PTSWAK
        Name(APWR, 0)//SSDT-PWRB PNP0C0C
        Name(SPFN, 0)//SSDT-SleepKey
        Name(ASLP, 0)//SSDT-SLPB PNP0C0E
        Name(ABUS, 1)//SSDT-SMBUS
        Name(TKPD, 0)//SSDT-ThinkPad
        Name(PRWG, 1)//SSDT-GPRW
        Name(PRWU, 0)//SSDT-UPRW
        Name(AXSP, 0)//SSDT-XPSI 0x001F0005
    }    
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF