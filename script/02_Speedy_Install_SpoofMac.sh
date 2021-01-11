#!/bin/sh

#   Install_SpoofMAC.sh
#  
#   term7 / 01.01.2020

#   re-distributed code by feross: https://github.com/feross/SpoofMAC

#   This installation script is meant to be educational and a resource for learning for unexperienced users. It has a lot of functionality that may be considered unnecessary from an advanced user's perspective. I.e. it pauses at certain times during the installation and displays a countdown. It echoes all commands to the terminal window and at certain times during the installation it displays informative texts and asks for user input. From a coders perspective who knows exactly what he/she wants, this may be a waste of time - yet we have written this script with users in mind that are not used to the command line. We hope that by running this script, users will take the time to go through the installation process, in order to understand the mechanics behind this script.

#   MIT License
#   Copyright (c) 2021

#   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


sudo port install python37
sudo port select --set python python37
sudo port select --set python3 python37
sudo port install py37-pip
sudo port select --set pip pip37
sudo port select --set pip3 pip37

sudo -H pip -v install SpoofMAC

sudo chmod +x /opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/spoof-mac.py
sudo ln -s /opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/spoof-mac.py /opt/local/bin/spoof-mac

DAEMON_FOLDER=/Library/LaunchDaemons
SPOOFMAC_DAEMON_NAME=spoof.mac
SPOOFMAC_DAEMON_FILE=$DAEMON_FOLDER/$SPOOFMAC_DAEMON_NAME.plist

[ -e "$SPOOFMAC_DAEMON_FILE" ] || sudo touch "$SPOOFMAC_DAEMON_FILE"

sudo tee "$SPOOFMAC_DAEMON_FILE" << EOF > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>${SPOOFMAC_DAEMON_NAME}</string>

<key>ProgramArguments</key>
<array>
<string>/opt/local/bin/spoof-mac</string>
<string>randomize</string>
<string>en0</string>
</array>

<key>RunAtLoad</key>
<true/>
</dict>
</plist>
EOF

sudo chown root:wheel "$SPOOFMAC_DAEMON_FILE"
sudo chmod 644 "$SPOOFMAC_DAEMON_FILE"
sudo launchctl load "$SPOOFMAC_DAEMON_FILE"
