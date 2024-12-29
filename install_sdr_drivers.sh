#!/bin/sh
wget https://raw.githubusercontent.com/osmocom/rtl-sdr/master/rtl-sdr.rules
sudo mv rtl-sdr.rules /etc/udev/rules.d/
echo "blacklist dvb_usb_rtl28xxu" | sudo tee /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

shutdown -r now

