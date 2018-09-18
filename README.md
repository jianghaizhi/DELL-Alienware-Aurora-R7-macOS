# DELL-Alienware-Aurora-R7-macOS
Full working macOS High Sierra (10.13.x) for DELL Alienware Aurora R7. 

There may still exist some issues in this configuration, if you have any problem or improvement, you can share it through submitting an issue.

# Hardware
This clover setting should work for recent Alienware Aurora R7 desktops  (released on 2017 and 2018) which installed with Intel CPU and Nvidia GPU. It may need some minor modifications to completely fulfill your machine.

The hardware details for my machine: i7-8700, GTX 1080, Adata sx8200 480g nvme ssd, DW1830 wifi+bluetooth card

# Working condition:
I connect two 4k monitors to the machine both through display port on GTX1080, they work good. 

Sleep and wake are good.

Usb ports are injected through SSDT-USB.aml

I do not use Intel integrated GPU, so it's not tested. 

I have no related devices, so I did not test the SD-Card reader, USB-C ports and HDMI ports. 

Killer 1535 Wifi+bluetooth card does not work (need to be replaced)

# Installation:

1. Following the general installation tutorial to install macOS. 

2. Install the Nvidia webdrive.

3. Install the bluetooth drive for DW1830 (BrcmPatchRAM).

4. Replace the default clover by this one.

5. ~~Better CPU/power management: use freqVectorsEdit.sh to add/replace FrequencyVectors in plists in X86PlatformPlugin.kext/Contents/Resources/. Details: https://github.com/Piker-Alpha/freqVectorsEdit.sh~~

6. Enable HWP (Intel Speed Shift) for a better CPU/power management.  See [this thread](https://www.tonymacx86.com/threads/skylake-hwp-enable.214915/) for a detailed information about HWP.

     In clover, HWP is enabled by default, however it will be disabled after waking from sleep (Due to Intel's policy). Therefore to retain HWP after resume from sleep, we should do:

     6.1. Copy HWPEnabler.kext from /files/HWPEnabler.kext to /Library/Extensions/. Then update the system kext cache.
 
     6.2. Create a file called '.wakeup' with this content:   
        `#!/usr/bin/env bash  
        /sbin/kextunload /Library/Extensions/HWPEnabler.kext  
        /sbin/kextload /Library/Extensions/HWPEnabler.kext`  

    6.3 Create a script to automatically launch HWPEnabler.kext after each wakeup from sleep. This can be done by sleepwatcher. Run the following commands in terminal from the location of your .wakeup file:  
        `chmod +x .wakeup   
        sudo cp .wakeup /var/root/  
        brew install sleepwatcher  
        sudo brew services start sleepwatcher`   

# Issues
...
