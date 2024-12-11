# ubuntu-mrefd-install
An installation script for the '[mrefd](https://github.com/n7tae/mrefd)' [M17](https://m17project.org/) Reflector - including the '[ham-dht-tools](https://github.com/n7tae/ham-dht-tools/)' tools and '[gomrefdash](https://github.com/kc1awv/gomrefdash)' dashboard, on a Ubuntu 24.04 Server LTS 64-Bit host system.

This is a quick script that takes a vanilla Ubuntu 24.04 Server LTS 64-Bit image (that you provide/setup) and installs the needed prequisites to to get _mrefd, ham-dht-tools, and gomrefdash *installed*_.

>[!IMPORTANT]
>The configuartion of _mrefd_ is not handled via this script. Please refer to the [mrefd](https://github.com/n7tae/mrefd) documentation once you successfully run this install script for further setup.
>The configuration of _gomrefdash_ is not handled via this script either. Please refer to it's documentation [here](https://github.com/kc1awv/gomrefdash) as well.

There are actually 5 key repositories pulled from GitHub and installed / built from source:

 - [RESTINO](https://github.com/aberaud/restinio/) [^1]
 - [OPENDHT](https://github.com/savoirfairelinux/opendht)
 - [MREFD](https://github.com/n7tae/mrefd)
 - [HAM-DHT-TOOLS](https://github.com/n7tae/ham-dht-tools/)
 - [GOMREFDASH]()

[^1]: The install script pulls and installs a specific archive.

## Tested on:
 - Raspberry Pi 4
 - 1 gig of memory (more is better)
 - 32g SD Card (almost certainly can get away with a smaller size)

>[!NOTE]
> If you have success (or failure) on other hardware / virtual platforms using Ubuntu I would be glad to hear!

## Initial Setup - Raspberry Pi:
 - Using the [Raspberry Pi Imager](https://github.com/raspberrypi/rpi-imager):
   - Device = Pi 4
   - OS = Other General Purpose OS
     - Ubuntu
       - Ubuntu 24.04 Server LTS (64-Bit)
 - Drop your burned SD card in and boot up.
 - Log in and pull down the latest OS updates:
   ```
   sudo apt update -y
   sudo apt upgrade -y
   ```
 - Reboot for good measure
 - While You're at it, go ahead and pull the latest full release upgrade:
  - e.g. if 24.04.1 LTS is available..
  ```
  do-release-upgrade
  ```
  - Reboot for good measure

## Run the install script:
- Download the [ubuntu-mrefd-install.sh](ubuntu-mrefd-install.sh) script.
- Ensure execute permission is set:
  ```
  chmod +x ubuntu-mrefd-install.sh
  ```
- And run...
  ```
  ./install-mrefd-install.sh
  ```
>[!NOTE] 
>'sudo' is called thoughout, so be prepaired to enter your password if prompted.

>[!WARNING]
> Currently the mrefd process and ham-dht-tools cli tools can not be run at the same time and bound to the same interface. I'm working to understand better why this is and will provide details once I have them.
