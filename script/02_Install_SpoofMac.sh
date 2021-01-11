#!/bin/sh

#   Install_SpoofMAC.sh
#  
#   term7 / 01.01.2020

#   re-distributed code by feross: https://github.com/feross/SpoofMAC

#   This installation script is meant to be educational and a resource for learning for unexperienced users. It has a lot of functionality that may be considered unnecessary from an advanced user's perspective. I.e. it pauses at certain times during the installation and displays a countdown. It echoes all commands to the terminal window and at certain times during the installation it displays informative texts and asks for user input. From a coders perspective who knows exactly what he/she wants, this may be a waste of time - yet we have written this script with users in mind that are not used to the command line. We hope that by running this script, users will take the time to go through the installation process, in order to understand the mechanics behind this script.

#   MIT License
#   Copyright (c) 2011-2020

#   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function countdown
{
local OLD_IFS="${IFS}"
IFS=":"
local ARR=( $1 )
local SECONDS=$((  (ARR[0] * 60 * 60) + (ARR[1] * 60) + ARR[2]  ))
local START=$(date +%s)
local END=$((START + SECONDS))
local CUR=$START

while [[ $CUR -lt $END ]]
do
CUR=$(date +%s)
LEFT=$((END-CUR))

printf "\r%02d:%02d:%02d" \
$((LEFT/3600)) $(( (LEFT/60)%60)) $((LEFT%60))

sleep 1
done
IFS="${OLD_IFS}"
echo "        "
}

sudo echo " "
echo '\n'
echo '\n'
echo '\n'
echo "   .d8888b.                              .d888 888b     d888"
echo "  d88P  Y88b                            d88P'  8888b   d8888"
echo "  Y88b.                                 888    88888b.d88888"
echo "   'Y888b.   88888b.   .d88b.   .d88b.  888888 888Y88888P888  8888b.   .d8888b"
echo "      'Y88b. 888 '88b d88''88b d88''88b 888    888 Y888P 888     '88b d88P'"
echo "         '88 888  888 888  888 888  888 888    888  Y8P  888 .d888888 888"
echo "  Y88b  d88P 888 d88P Y88..88P Y88..88P 888    888   '   888 888  888 Y88b."
echo "   'Y8888P'  88888P'   'Y88P'   'Y88P'  888    888       888 'Y888888  'Y8888P"
echo "             888"
echo "             888"
echo "             888"
echo "             888"
echo '\n'
echo '\n'
countdown "00:00:07"
echo "--------------------------------------------------------------------------------"

echo '\n'
echo '\n'
echo "                                            / SPOOFMAC / WHAT THIS SCRIPT DOES /"
echo "--------------------------------------------------------------------------------"
echo " "
echo "Your computer can always be identified via the unique MAC address of its network"
echo "interfaces (i.e. Ethernet, Wi-Fi & Bluetooth). SpoofMac is an open source tool"
echo "that makes it easy for you to change the MAC addresses of your computer via the"
echo "Command Line, so that it becomes impossible to track and fingerprint you via"
echo "your device's MAC addresses."
echo '\n'
echo "This simple script installs Python and PIP (which are necessary prerequisites),"
echo "as well as SpoofMac. Further, if you choose so, it sets up a Launch Daemon for"
echo "you, that uses SpoofMac to randomize the MAC address of your Ethernet and Wi-Fi"
echo "Cards whenever you start your computer, making it impossible for other devices"
echo "and for network operators to discover your real identity via its MAC when you"
echo "connect to the internet."
echo '\n'
echo "SpoofMac is written and maintained by feross: https://github.com/feross/SpoofMAC"
echo '\n'
echo "--------------------------------------------------------------------------------"
read -s -p "Press [ENTER] to continue: "

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                  ------------------------------------------";
echo "                  ARE YOU SURE YOU WANT TO INSTALL SPOOFMAC?";
echo "                  ------------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
while true
do
read -r -p "Type [install] to install, or [exit] to abort and press [ENTER]: " CONT
case $CONT in
[i][n][s][t][a][l][l])

#  Install SpoofMAC & Prerequisites

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                --------------------------------------------";
echo "                Preparing to install Python3, PIP & SpoofMac";
echo "                --------------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:03"


echo "--------------------------------------------------------------------------------"
echo '\n'
echo '\n'
echo "sudo port install python37"
echo '\n'
sudo port install python37
echo '\n'
echo "sudo port select --set python python37"
sudo port select --set python python37
echo "sudo port select --set python3 python37"
echo '\n'
sudo port select --set python3 python37
echo "sudo -H pip -v install SpoofMAC"
echo '\n'
sudo port install py37-pip
sudo port select --set pip pip37
sudo port select --set pip3 pip37
echo "sudo -H pip -v install SpoofMAC"
echo '\n'
sudo -H pip -v install SpoofMAC
echo '\n'
echo "sudo chmod +x /opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/spoof-mac.py"
sudo chmod +x /opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/spoof-mac.py
echo "sudo ln -s /opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/spoof-mac.py /opt/local/bin/spoof-mac"
sudo ln -s /opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/spoof-mac.py /opt/local/bin/spoof-mac

echo "spoof-mac.py randomize en0"
sudo spoof-mac randomize en0

echo "OUTPUT: spoof-mac list"
echo "--------------------------------------------------------------------------------"
echo " "

spoof-mac list

break;;
[e][x][i][t])

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                                ---------------";
echo "                                A B O R T I N G";
echo "                                ---------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:7"
exit;;
*)

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                        --------------------------------";
echo "                        INVALID INPUT - PLEASE TRY AGAIN";
echo "                        --------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
;;
esac
done

echo " "
echo "--------------------------------------------------------------------------------"
echo "Your Wi-Fi device should have changed MAC addresses now! To list"
echo "all available network devices and their respective MAC addresses, enter this"
echo "command into a Terminal Window: spoof-mac list"
echo '\n'
echo "To list all available commands type this command: spoof-mac --help"
echo '\n'
echo "                                                -> More Info: SpoofMAC/README.md"
echo "--------------------------------------------------------------------------------"
read -s -p "Press [ENTER] to continue: "

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "              -------------------------------------------------";
echo "              DO YOU WANT TO SETUP THE SPOOF-MAC LAUNCH DAEMON?";
echo "              -------------------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
while true
do
read -r -p "Type [setup] to setup, or [skip] to skip and press [ENTER]: " CONT2
case $CONT2 in
[s][e][t][u][p])

#  Setup SpoofMAC Launch Daemon

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                       --------------------------------";
echo "                       Preparing SpoofMac Launch Daemon";
echo "                       --------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:03"

echo "--------------------------------------------------------------------------------"
echo '\n'
echo '\n'
echo "Installation Path: /Library/LaunchDaemons/spoof.mac.plist"
echo "-> More info on spoof.mac.plist: SpoofMAC/README.txt"
echo '\n'

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

echo "sudo chown root:wheel /Library/LaunchDaemons/spoof.mac.plist"
sudo chown root:wheel "$SPOOFMAC_DAEMON_FILE"
echo "sudo chmod 0644 /Library/LaunchDaemons/spoof.mac.plist"
sudo chmod 644 "$SPOOFMAC_DAEMON_FILE"
echo '\n'
echo "sudo launchctl load /Library/LaunchDaemons/spoof.mac.plist"
sudo launchctl load "$SPOOFMAC_DAEMON_FILE"
echo '\n'
echo '\n'
echo '\n'
echo "OUTPUT: spoof-mac list"
echo "--------------------------------------------------------------------------------"
echo " "

spoof-mac list

echo " "
echo "--------------------------------------------------------------------------------"
echo "The SpoofMAC Launch Daemon has been configured."
echo " "
echo "Your Wifi MAC-address will now change automatically whenever you reboot your"
echo "computer. To randomize more network interface such as Bluetooth, edit this"
echo "Launch Daemon: /Library/LaunchDaemons/spoof.mac.plist"
echo '\n'
echo "--------------------------------------------------------------------------------"
read -s -p "Press [ENTER] to exit the installation script: "

echo '\n'
echo '\n'
echo '\n'
echo "--------------------------------------------------------------------------------"
echo '\n'
echo "                              888"
echo "                              888"
echo "            .d8888b   .d88b.  888888 888  888 88888b."
echo "            88K      d8P  Y8b 888    888  888 888 '88b"
echo "            'Y8888b. 88888888 888    888  888 888  888"
echo "                 X88 Y8b.     Y88b.  Y88b 888 888 d88P"
echo "             88888P'  'Y8888   'Y888  'Y88888 88888P"
echo "                                              888"
echo "                                              888          888"
echo "                                              888          888"
echo "       .d8888b .d88b.  88888b.d88b.  88888b.  888  .d88b.  888888 .d88b."
echo "      d88P'   d88''88b 888 '888 '88b 888 '88b 888 d8P  Y8b 888   d8P  Y8b"
echo "      888     888  888 888  888  888 888  888 888 88888888 888   88888888"
echo "      Y88b.   Y88..88P 888  888  888 888 d88P 888 Y8b.     Y88b. Y8b."
echo "       'Y8888P 'Y88P'  888  888  888 88888P'  888  'Y8888   'Y888 'Y8888"
echo "                                     888"
echo "                                     888"
echo "                                     888"
echo '\n'
echo "                                               -> More Info: SpoofMAC/README.txt"

break;;
[s][k][i][p])

echo '\n'
echo '\n'
echo "--------------------------------------------------------------------------------"
echo '\n'
echo "                              888"
echo "                              888"
echo "            .d8888b   .d88b.  888888 888  888 88888b."
echo "            88K      d8P  Y8b 888    888  888 888 '88b"
echo "            'Y8888b. 88888888 888    888  888 888  888"
echo "                 X88 Y8b.     Y88b.  Y88b 888 888 d88P"
echo "             88888P'  'Y8888   'Y888  'Y88888 88888P"
echo "                                              888"
echo "                                              888          888"
echo "                                              888          888"
echo "       .d8888b .d88b.  88888b.d88b.  88888b.  888  .d88b.  888888 .d88b."
echo "      d88P'   d88''88b 888 '888 '88b 888 '88b 888 d8P  Y8b 888   d8P  Y8b"
echo "      888     888  888 888  888  888 888  888 888 88888888 888   88888888"
echo "      Y88b.   Y88..88P 888  888  888 888 d88P 888 Y8b.     Y88b. Y8b."
echo "       'Y8888P 'Y88P'  888  888  888 88888P'  888  'Y8888   'Y888 'Y8888"
echo "                                     888"
echo "                                     888"
echo "                                     888"
echo '\n'
echo "                                               -> More Info: SpoofMAC/README.txt"
exit;;
*)

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                        --------------------------------";
echo "                        INVALID INPUT - PLEASE TRY AGAIN";
echo "                        --------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
;;
esac
done


exit
