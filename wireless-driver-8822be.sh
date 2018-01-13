lspci #for me it’s b822 (which means version 8822be)
sudo apt update
sudo apt install git
git clone https://github.com/rtlwifi-linux/rtlwifi-next
cd rtlwifi-next
make
sudo make install
sudo modprobe rtl8822be