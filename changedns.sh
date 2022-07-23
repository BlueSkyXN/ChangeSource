#!/bin/sh

# 检测 root
CheckRoot(){
	[[ $(id -u) != 0 ]] && echo -e "请使用${red} root ${none}用户运行该脚本。" && exit 1
}

# 检测系统版本
CheckSystem(){
	if [ -f /etc/redhat-release ]; then
		release="centos"
	elif cat /etc/issue | grep -Eqi "debian"; then
		release="debian"
	elif cat /etc/issue | grep -Eqi "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -Eqi "debian"; then
		release="debian"
	elif cat /proc/version | grep -Eqi "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
		release="centos"
	fi
}

# 安装 resolvconf
CheckRequirement(){
	if  [ ! -e '/usr/sbin/resolvconf' ] && [ ! -e '/sbin/resolvconf' ]; then
		echo "正在安装必要的程序 resolvconf ，请稍后..."
		if [ "${release}" == "centos" ]; then
			yum -y install resolvconf > /dev/null 2>&1
		else
			apt-get update
			apt-get -y install resolvconf > /dev/null 2>&1
		fi
	fi
	systemctl stop resolvconf.service > /dev/null 2>&1
	systemctl start resolvconf.service > /dev/null 2>&1
	systemctl enable resolvconf.service > /dev/null 2>&1
}

# 判断输入的 nameserver IP 是否正确
CheckIP(){
	if [[ $nameserver =~ ^([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]] 
	then
		IPcheck="1"
	else
		IPcheck="0"
	fi
}

# 修改 DNS
DoChange(){
	mv /etc/resolv.conf /etc/resolv.conf.bak
	echo "nameserver "$nameserver"" > /etc/resolv.conf
	echo "nameserver "$nameserver"" > /etc/resolvconf/resolv.conf.d/head
	systemctl restart resolvconf.service
}

# 交互内容
ChangeDNS(){
	CheckRoot
	CheckSystem
	CheckRequirement
	echo "当前 Nameserver 如下："
	cat /etc/resolv.conf | grep nameserver
	read -p "请输入要设置的 Nameserver 地址: " nameserver
	CheckIP
	if [[ $IPcheck == "1" ]]
	then
		DoChange
	else
		while [ $IPcheck == "0" ]
			do
			echo "Nameserver 格式错误，请输入正确的 IP 地址。"
			read -p "重新输入 Nameserver 地址: " nameserver
			CheckIP
		done
		DoChange
	fi
	echo "已修改，当前 Nameserver 如下："
	cat /etc/resolv.conf | grep nameserver
	echo "旧 resolv.conf 已备份至 /etc/resolv.conf.bak"
}

ChangeDNS