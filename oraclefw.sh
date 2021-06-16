#! /bin/bash

sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 5555 -j ACCEPT
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 8008 -j ACCEPT
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 9999 -j ACCEPT
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 1422 -j ACCEPT
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 22 -j ACCEPT
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 3306 -j ACCEPT
sudo iptables-save
sudo apt-get update
sudo apt-get install iptables-persistent -y
sudo netfilter-persistent save
sudo netfilter-persistent reload