yum -y install curl wget epel-release unzip screen fuse fuse-devel cpulimit
yum -y update
bash <(curl -Ls "https://cdn.000714.xyz/BlueSkyXN/ChangeSource/master/clone.sh")
wget -O "/root/speedtest" "https://objectstorage.me-dubai-1.oraclecloud.com/n/axdoh51w1xdx/b/GIT/o/speedtest" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/speedtest"
chmod 777 "/root/speedtest"
wget -O "/root/besttrace" "https://objectstorage.me-dubai-1.oraclecloud.com/n/axdoh51w1xdx/b/GIT/o/besttrace" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/besttrace"
chmod 777 "/root/besttrace"
wget -O "/root/tcp.sh" "https://cdn.000714.xyz/BlueSkyXN/ChangeSource/master/tcp.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/tcp.sh"
chmod 777 "/root/tcp.sh"
wget -O "/root/mt.sh" "https://cdn.000714.xyz/BlueSkyXN/ChangeSource/master/mt.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/mt.sh"
chmod 777 "/root/mt.sh"
clear
