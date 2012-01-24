AirPlayDemo: Example of AirPlay secondary display for iOS apps
===================================================

Synopsis
------------

AirPlayDemo is a simple example showing how to use Apple's AirPlay as a secondary or accessory display for your iOS application (like Real Racing 2 HD).
When run from a supported device, this will display the number of each screen, on each screen. The iOS device will show "1", and the AirPlay display and/or a display using the External Display connector will show a "2".

This app should be enough to give you something to start with.

The Details
---------------

Apple's developer documentation for implementing this functionality does not really make it clear that using an AirPlay connected device as a second display depends on the user enabling display mirroring on their device. When mirroring is enabled, you will get the UIScreenDidConnectNotification if you have registered for it. Users can enable and disable mirroring while your application is running, so you should handle it.

AirPlay documentation:
-------------------------------
[Apple : Enrich Your App for AirPlay](http://developer.apple.com/library/ios/#documentation/AudioVideo/Conceptual/AirPlayGuide/EnrichYourAppforAirPlay/EnrichYourAppforAirPlay.html#//apple_ref/doc/uid/TP40011045-CH6-DontLinkElementID_3)

[UIScreen Class Reference](http://developer.apple.com/library/IOs/#documentation/UIKit/Reference/UIScreen_Class/Reference/UIScreen.html)

To start mirroring:
------------------------
[Setting up and troubleshooting AirPlay Mirroring](http://support.apple.com/kb/TS4085)