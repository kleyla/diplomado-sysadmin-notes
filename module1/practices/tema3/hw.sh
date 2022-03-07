#!/bin/bash

# karen rodriguez

sudo dmidecode -t system | grep -w Manufacurer >> $HOSTNAME.txt
sudo dmidecode -t system | grep -w 'Product Name' >> $HOSTNAME.txt
sudo dmidecode -t system | grep -w Family >> $HOSTNAME.txt

lscpu | grep -w 'CPU(s)' >> $HOSTNAME.txt
lscpu | grep -w '\«Socket(s)\»' >> $HOSTNAME.txt
