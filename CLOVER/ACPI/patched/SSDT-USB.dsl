DefinitionBlock ("SSDT-USB.aml", "SSDT", 1, "sample", "USBFix", 0x00003000)
{
    // "USBInjectAllConfiguration" : override settings for USBInjectAll.kext
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        // "RehabManConFiguration"
        Name(RMCF, Package()
        {
            // XHC overrides for 200-series boards
            "8086_a2af", Package()
            {
                "port-count", Buffer() { 0x17, 0, 0, 0}, // Highest port number is SS** at 0xNN
                "ports", Package()
                {   // TO COMPLETE THIS FILE, ADD ALL YOUR PORTS BELOW HERE, THEN SET port-count ABOVE
                    "HS01", Package() // USB2 device on a USB2 port located 2nd from left, 2nd row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x01, 0, 0, 0 },
                    },
                    "HS02", Package() // USB2 device on a USB2 port located 1st from left, 2nd row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x02, 0, 0, 0 },
                    },
                    "HS03", Package() // USB2 device on a USB2 port located 3rd from left, 2nd row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x03, 0, 0, 0 },
                    },
                    "HS04", Package() // USB2 device on a USB2 port located 4th from left, 2nd row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x04, 0, 0, 0 },
                    },
                    "HS05", Package() // USB2 device on a USB2 port located 1st from left, 1st row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x05, 0, 0, 0 },
                    },
                    "HS06", Package() // USB2 device on a USB2 port located 2nd from left, 1st row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x06, 0, 0, 0 },
                    },
                    "HS07", Package() // USB2 device on a USB3 port located on front panel, 4th from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x07, 0, 0, 0 },
                    },
                    "HS08", Package() // Internal Bluetooth device
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 0x08, 0, 0, 0 },
                    },
                    "HS09", Package() // USB2 device on a USB3 port located on front panel, 1st from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x09, 0, 0, 0 },
                    },
                    "HS10", Package() // USB2 device on a USB3 port located 4th from left, 4th row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x0a, 0, 0, 0 },
                    },
                    "HS11", Package() // USB2 device on a USB3 port located on front panel, 2nd from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x0b, 0, 0, 0 },
                    },
                    "HS12", Package() // USB2 device on a USB3 port located 3rd from left, 4th row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x0c, 0, 0, 0 },
                    },
                    "HS13", Package() // USB2 device on a USB3 port located on front panel, 3rd from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x0d, 0, 0, 0 },
                    },
                    "HS14", Package() // USB2 device on a USB3 port located 2nd from left, 4th row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x0e, 0, 0, 0 },
                    },

                    "SS01", Package() // USB3 port located on front panel, 3rd from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x11, 0, 0, 0 },
                    },

                    "SS02", Package() // USB3 port located on front panel, 4th from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x12, 0, 0, 0 },
                    },

                    "SS03", Package() // USB3 port located on front panel, 1st from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x13, 0, 0, 0 },
                    },

                    "SS04", Package() // USB3 port located on front panel, 2nd from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x14, 0, 0, 0 },
                    },

                    "SS05", Package() // USB3 port located 2nd from left, 4th row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x15, 0, 0, 0 },
                    },

                    "SS06", Package() // USB3 port located 4th from left, 4th row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x16, 0, 0, 0 },
                    },

                    "SS07", Package() // USB3 port located 3rd from left, 4th row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x17, 0, 0, 0 },
                    },
                },
            },
        })
    }
}