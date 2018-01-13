# Configuration scripts for Ubuntu 16.04 #
- [Graphic Driver (ASUS 1080)](https://github.com/kornosk/ubuntu-config/blob/master/README.md#graphic-driver-asus-1080)
- [Wifi Driver](https://github.com/kornosk/ubuntu-config/blob/master/README.md#wifi-driver)

## Graphic Driver (ASUS 1080) ##
1. Remove GPU from motherboard
2. Plug in HDMI connect screen to motherboard directly instead of plugging into GPU
3. Turn on PC and install driver version nvidia-387 (January 11, 2017)
4. Remove all existing nvidia drivers
```bash
sudo apt-get purge nvidia*
```
5. Add repository for fetching nvidia drivers
```bash
sudo apt-add-repository ppa:graphics-drivers
```
6. Update and download nvidia driver (version 387 for 1080 as of today - January 12, 2018)
```bash
sudo apt-get update
sudo apt-get install nvidia-387
```
7. Shutdown PC
8. Plug GPU into motherboard and move HDMI to plug into GPU
9. Turn on PC, now it should work perfectly. You can check by
```bash
lsmod |grep nvidia => this will show something, not empty
```

## Wifi Driver ##
1. Check for wifi hardware version by this command and look for something about WIFI/Wireless/Network. Note that as of today, this works with kernel version 4.10.0-28. Kernel version 4.13 doesn’t work!!! (Select ubuntu kernel when turn on the PC)
```bash
#for me it’s b822 (which means version 8822be)
lspci
```
2. Install git command line package and clone wireless drivers
```bash
sudo apt update
sudo apt install git
git clone https://github.com/rtlwifi-linux/rtlwifi-next
```
3. Unpackage and install
```bash
cd rtlwifi-next
make
sudo make install
sudo modprobe rtl8822be
```