# DELL-Alienware-Aurora-R7-macOS (Mojave, 10.14.x)
Full working macOS for DELL Alienware Aurora R7. 

There may still exist some issues in this configuration, if you have any problem or improvement, you can share it through submitting an issue.

# Update log
**2019/11/18**  

Update to Mojave 10.14.x, The configuration and files for High Serria are moved to directory High-Serria-10.13.6**. 

Remove Nvidia Webdrive, replace Nvidia card by AMD card (RX 480,580,470,570,VEGA56, VEGA64, etc.). 

Replace SMBIOS imac 14,1 by macmini 8,1. mac mini 2018 natively support the 8th generation Intel cpu and UHD 630 graphics card. 

Remove HWPEnabler.kext. 

Add some useful tools.  

**2019/11/22**

Update SSDT for USBInjectAll.kext, USB3 ports can now run at 5Gb/s. 
> <font size="2">add: /EFI/CLOVER/ACPI/patched/SSDT-UIAC.aml    
> update: /EFI/CLOVER/config.plist</font>

# Hardware
This clover setting should work for recent Alienware Aurora R7 desktops  (released on 2017 and 2018) which installed with Intel CPU and Nvidia GPU. It may need some minor modifications to completely fulfill your machine.

The hardware details for my machine: i7-8700, ~~GTX 1080~~, MSI RX 580, Adata sx8200 480g nvme ssd, DW1830 wifi+bluetooth card

# Working condition
I connect two 4k monitors to the machine both through display port on RX 580, they work good. 

Facetime and imessage work good.

Bluetooth works good.

Airdrop works good.

Sleep and wake are good.

~~Usb ports are injected through SSDT-USB.aml~~

Intel integrated GPU UHD 630 is natively supported by Majove when using macmini 8,1. 

I have no related devices, so I did not test USB-C ports and HDMI ports. 

Killer 1535 Wifi+bluetooth card does not work (need to be replaced).

Magic mouse and Trackpad work good.

# Issues
There is no suitable patches now, USB3 works on 480 M/s (Majove 10.14.2)

# Installation

1. Following the general installation tutorial to install macOS. 

2. Install the bluetooth drive for DW1830 (BrcmPatchRAM) 
    Copy kexts in directory bluetooth to /System/Library/Exetensions

3. Use Kext Utility to update cache for kexts, you can find this tool in directory tools

4. Replace the default EFI by this one.

    


