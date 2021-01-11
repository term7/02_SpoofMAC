#!/bin/sh

#   Install_SpoofMAC.sh
#
#   term7 / 01.01.2020

#   MIT License
#   Copyright (c) 2021

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

bold=$(tput bold)
normal=$(tput sgr0)

sudo echo " "
echo " "
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                   -----------------------------------------";
echo "                   ARE YOU SURE YOU WANT TO DELETE SPOOFMAC?";
echo "                   -----------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'

while true
do
read -p "Type [delete] to remove SpoofMac, or [exit] to abort and press [ENTER]: " CONT
case $CONT in
[d][e][l][e][t][e])

echo "--------------------------------------------------------------------------------"
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "sudo -H pip -v uninstall SpoofMAC"
echo '\n'
sudo -H pip -v uninstall SpoofMAC
echo '\n'


DAEMON_FOLDER=/Library/LaunchDaemons
SPOOFMAC_DAEMON_NAME=spoof.mac
SPOOFMAC_DAEMON_FILE=$DAEMON_FOLDER/$SPOOFMAC_DAEMON_NAME.plist

SPOOFMAC_SYMLINK=/opt/local/bin/spoof-mac

echo "sudo launchctl unload unload /Library/LaunchDaemons/spoof.mac.plist"
sudo launchctl unload "$SPOOFMAC_DAEMON_FILE"
echo '\n'
echo "sudo rm -f /Library/LaunchDaemons/spoof.mac.plist"
echo "sudo rm -f /usr/local/bin/spoof-mac.py"

sudo rm -f "$SPOOFMAC_DAEMON_FILE" "$SPOOFMAC_SYMLINK"

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                                ---------------";
echo "                                F I N I S H E D";
echo "                                ---------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:7"

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

exit
