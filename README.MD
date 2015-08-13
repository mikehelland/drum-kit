# Octoblu Drum Kit

This is an experimental project into using music with IoT. The goal is to create
an 808 drum machine that can be controlled remotely through [Meshblu](https://github.com/octoblu/meshblu)

The application is a simple React web application that connects to Meshblu. There
are 9 pads and you can select a separate drum sound for each pad. The drum samples
are from a Roland 808 drum machine.

The app will connect to Meshblu and store its UUID and Token in Local Storage.

Dependencies:
Gulp
React
Howler.js

Press the 'Edit' button and select a drum sample for each pad

When you send a message to the device, send a message with 'play' as a property
with the ID of the Pad[Pad1 to Pad9] to play the pad with the selected sample.
