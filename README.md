# Novation ZeRO SLMkII - Pd Ctrl
## Intro
This Pure Data patch allows to receive/send MIDI messages from/to the Novation ZeRO SLMkII MIDI controller.

## Setup
1. connect the device to the computer
2. select template 32: *Ableton*
3. launch Pure Data
4. select *SL MkII MIDI* port 2 for both MIDI input and output
5. open *ZeRO_SLMkII.pd*
6. this will automatically initialize the device (sometimes it takes a couple of seconds before this process terminates)
7. start moving the controls on ZeRO SLMkII and check both the screens on the device and the patch

## About the patch
*ZeRO_SLMkII.pd* uses the abstractions in the *utils* folder.
These are:
* [ENCODER]: allows to intercept MIDI from single encoder and talks to [SCREENS] and [ENCODER_LEDS] to control relative LED ring - encoders can ahve different ranges (from 0 to *N* - since they sends delta)
* [ENCODER_LEDS]: used to set encoder LED rings
* [SCREENS]: contains [SCREEN] objects. other patches talk to this to set screens (ie display values on screens)
* [FADERS]: receives messages from faders and send value to the screens
* [KNOBS]: receives messages from the knobs
* [PADS]: receives messages from pads - to be noted that only NOTE ON messages are received (for more info see SL MkII user guide at page 34)

### Open Sound Control
The patch uses [Open Sound Control](http://opensoundcontrol.org/) protocol to send messages over network.
The default settings are:
* IP:               localhost
* port:             3000
* address:          /ZeRO/*tag data*
* tags and data (all numbers are floats - *value* is always expressed as a float in a range 0-1):    
    * encoders: *enc end_id value*
    * knobs: *knob end_id value*
    * pads: *pad end_id value*
    * buttons: *but end_id value*
    * faders: *fad end_id value*


# Links
[ZeRO SLMkII user guide](https://customer.novationmusic.com/sites/customer/files/novation/downloads/4119/english108.pdf)
