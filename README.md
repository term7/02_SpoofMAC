# SpoofMAC-Installer for OS X

This installation script is targeted to users who wish to make informed decisions and who want to improve their privacy and security on a Mac. We want everybody to be able to able to do this installation, which is why this script is meant to be educative and a source of learning - especially for users who have never used the command line (Terminal.app) before.

SpoofMAC is a Python script written by feross:

* [https://github.com/feross/SpoofMAC](https://github.com/feross/SpoofMAC)

Feross also provides a node.js port of this package with easy-to-follow installation instructions:

* [https://github.com/feross/spoof](https://github.com/feross/spoof)

Our script has been tested on MacOS Big Sur.
The installation is running stable on our own Macs.

However, we will not provide warranties of any kind. Only you are resposible if you break something during this installation.
To suggest improvements, please report an issue or send a pull request.


## Why install SpoofMAC?


*"I made SpoofMac because changing your MAC address in Mac OS X is harder than it should be. The biggest annoyance is that the Wi-Fi card (Airport) needs to be manually disassociated from any connected networks in order for the change to be applied correctly. Doing this manually every time is tedious and lame."*

(Feross Aboukhadijeh / Maker of SpoofMac)

To spoof your MAC address is especially recommended if you are working on a laptop using public Wifi in order to mitigate tracking methods that identify and track your devices MAC address.

<p align="center">
  <img src="/png/SpoofMac.png" title="SpoofMAC Installer">
</p>

## PREREQUISITES & INSTALLATION

We are using MacPorts, which is why this script will use the default MacPorts directory as an install location.
    
[02_Install_SpoofMac.sh](https://github.com/term7/02_SpoofMAC/blob/main/script) is a script that will set up SpoofMAC (by Feross Aboukhadijeh) for you. Simply execute the installation script in a terminal window, when prompted type your admin password and press ENTER. The script will run all necessary commands for you. It also sets up a Launch Daemon that automatically randomizes Wifi and Ethernet MAC addresses of your computer whenever you start it. You can review the whole installation process in your terminal window.
For advanced users, who want to speed up the whole process, we recommend you use [02_Speedy_Install_SpoofMac.sh](https://github.com/term7/02_SpoofMAC/blob/main/script).


After the installation SpoofMAC will automatically run on your Mac whenever you start your computer. 

If you don't want to use SpoofMAC anymore, simply run [02_Uninstall_SpoofMac.sh](https://github.com/term7/02_SpoofMAC/blob/main/script) to purge SpoofMAC and the SpoofMAC launch daemon from your system.

### PLEASE NOTE

When you run the SpoofMAC-Installer or SpoofMAC your Wifi connection might be interrupted. This is normal. Simply reconnect to the internet after the installation has finished.


## Usage

You can use SpoofMac to manually change your MAC addresses via the command line. To do so, open a Terminal Window to type commands.


List all usage instructions:

    spoof-mac --help


List all available devices:

    spoof-mac list

        - "Ethernet" on device "en0" with MAC address 70:56:51:BE:B3:00
        - "Wi-Fi" on device "en1" with MAC address 70:56:51:BE:B3:01 
          currently set to 70:56:51:BE:B3:02
        - "Bluetooth PAN" on device "en1"


List available devices, but only those on Wi-Fi:

    spoof-mac list --wifi

        - "Wi-Fi" on device "en1" with MAC address 70:56:51:BE:B3:01 
          currently set to 70:56:51:BE:B3:02


Randomize MAC address (requires root) using hardware port name:

    sudo spoof-mac randomize wi-fi


Randomize MAC address (requires root) using device name:

    sudo spoof-mac randomize en0


Set device MAC address to something specific (requires root):

    sudo spoof-mac set 00:00:00:00:00:00 en0


Reset device to its original MAC address (requires root):
    
    spoof-mac reset wi-fi



## BACKGROUND KNOWLEDGE: MAC ADDRESS & TRACKING

The MAC address of a wireless device constitutes an excellent unique identifier to track its owner. In fact MAC address of wireless devices are collected and stored by several systems.
A first example is the network infrastructure that is often storing information on the device that are connecting to it. For instance logs of wireless routers include the MAC address of all the devices that have been connected. Those logs contains event related to management aspect of the wireless network (association, authentication, disconnection, etc.) and each event associates a macaddress with a timestamp.
The second example is the Radio-Frequency tracking systems [12] that are specifically designed to track the movement of individuals thanks to the wireless devices that they are wearing. Those systems are based on a set of sensors collecting wireless signals that triangulate and track over time the movement of individuals. Those systems are deployed in areas such as shopping centres, museum, roads where they provide valuable information on mobility patterns and shopping habits.

* [https://hal.inria.fr/file/index/docid/858324/filename/Wi-Fi_Stalking.pdf](https://hal.inria.fr/file/index/docid/858324/filename/Wi-Fi_Stalking.pdf)
    

## MIT License

Copyright (c) 2021 term7

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
