sudo yum -y install curl wget epel-release unzip screen fuse fuse-devel cpulimit
sudo yum -y update
sudo bash <(curl -Ls "https://cdn.000714.xyz/BlueSkyXN/ChangeSource/master/clone.sh")
sudo wget -O "/root/speedtest" "https://objectstorage.me-dubai-1.oraclecloud.com/n/axdoh51w1xdx/b/GIT/o/speedtest" --no-check-certificate -T 30 -t 5 -d
sudo chmod +x "/root/speedtest"
sudo chmod 777 "/root/speedtest"
sudo wget -O "/root/besttrace" "https://objectstorage.me-dubai-1.oraclecloud.com/n/axdoh51w1xdx/b/GIT/o/besttrace" --no-check-certificate -T 30 -t 5 -d
sudo chmod +x "/root/besttrace"
sudo chmod 777 "/root/besttrace"
sudo wget -O "/root/tcp.sh" "https://cdn.000714.xyz/BlueSkyXN/ChangeSource/master/tcp.sh" --no-check-certificate -T 30 -t 5 -d
sudo chmod +x "/root/tcp.sh"
sudo chmod 777 "/root/tcp.sh"
sudo wget -O "/root/mt.sh" "https://cdn.000714.xyz/BlueSkyXN/ChangeSource/master/mt.sh" --no-check-certificate -T 30 -t 5 -d
sudo chmod +x "/root/mt.sh"
sudo chmod 777 "/root/mt.sh"
clear
