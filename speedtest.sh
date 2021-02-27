#!/bin/bash
clear
DIR=${HOME}/vpsTest
if [ ! -d $DIR ];then
    mkdir $DIR
fi
cDIR=`pwd`
cd $DIR
trap "cl" 2
cl () {
    echo "..."
    echo "clear..."
    rm -f $cDIR/$0
    echo "OK"
    exit 0
}
# copy from superbench
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
out1 () {
	color=$1
	what=$2
	array=("r" "g" "y" "b" "p" "s" "w")
	for i in `seq 31 37`;do
		if [ ${array[$(($i-31))]} == $color ] ; then
			echo -ne "\e[1;${i}m${what}\e[0m"
			break
		fi
	done
}
out0 () {
	color=$1
	what=$2
	array=("r" "g" "y" "b" "p" "s" "w")
	for i in `seq 31 37`;do
		if [ ${array[$(($i-31))]} == $color ] ; then
			echo -ne "\e[0;${i}m${what}\e[0m"
			break
		fi
	done
}
# id=0
# if [ ! $# -eq 0 ];then
#     id=$1
# fi
out0 s "使用方法: wget vpstest.cn/it && bash it 或 wget git.io/vpstest && bash vpstest\n"
out0 r "7,4 已修复，请清空残余文件后使用\n"
out0 b "添加sysbench脚本\n"
while [ 1 -eq 1 ];do
out1 y "-------------------------------\n"
out1 y "|"
out0 y " 请选择需要测试的脚本序号:   "
out1 y "|\n"
out1 y "|"
out1 b " 1. bench.sh                 "
out1 y "|\n"
out1 y "|"
out1 b " 2. LemonBench               "
out1 y "|\n"
out1 y "|"
out1 b " 3. superspeed               "
out1 y "|\n"
out1 y "|"
out1 b " 4. superbench修复版- yzlijie"
out1 y "|\n"
out1 y "|"
out1 b " 5. 91yuntest                "
out1 y "|\n"
out1 y "|"
out1 b " 6. ZBench                   "
out1 y "|\n"
out1 y "|"
out1 b " 7. superbench修复+多节点版  "
out1 y "|\n"
out1 y "|"
out1 b " 8. UnixBench                "
out1 y "|\n"
out1 y "|"
out1 b " 9. GeekBench5               "
out1 y "|\n"
out1 y "|"
out1 b " 10.kos回程测试              "
out1 y "|\n"
out1 y "|"
out1 b " 11.超内存测试               "
out1 y "|\n"
out1 y "|"
out1 b " 12.sysbench-cpu测试         "
out1 y "|\n"
out1 y "|"
out1 b " 13.路由测试(需提供目标ip)   "
out1 y "|\n"
out1 y "|"
out1 r " 14.清空残余文件(保留大文件) "
out1 y "|\n"
out1 y "|"
out1 r " 15.清空残余文件(全部清空)   "
out1 y "|\n"
out1 y "|"
out1 r " 16.卸载kos                  "
out1 y "|\n"
out1 y "|"
out1 r " 0. 退出                     "
out1 y "|\n"
out1 y "-------------------------------\n"
read id
case $id in
    0)
        break
        ;;
    1)
        wget -qO- http://bench.sh | bash
        break
        ;;
    2)
        if [ ! -f ${DIR}/LemonBench.sh ]; then
            curl -fsL https://ilemonra.in/LemonBenchIntl > ${DIR}/LemonBench.sh
        fi
        bash ${DIR}/LemonBench.sh fast
        break
        ;;
    3)
        while [ ! -f ${DIR}/superspeed.sh ]; do
            wget -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/ernisn/superspeed/master/superspeed.sh
        done
        bash ${DIR}/superspeed.sh
        break
        ;;
    4)
        while [ ! -f ${DIR}/superbench.sh ]; do
            wget -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/yzlijie/SPDTST/e971a137a6ca698162a54234b762d28fd9ee9991/superbench.sh
        done
        bash ${DIR}/superbench.sh
        break
        # clear
        # out0 p "原作者已删除该脚本，请重新选择\n"
        ;;
    5)
        while [ ! -f ./test.sh ]; do
            wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/91yuntest/master/test.sh
        done
        echo "91yuntest:请选择需要测试的项目序号(以空格分开)"
        echo "1.io 2.bandwidth 3.chinabw 4.download 5.traceroute 6.backtraceroute 7.allping 8.gotoping 9.benchtest"
        arr=("io," "bandwidth," "chinabw," "download," "traceroute," "backtraceroute," "allping," "gotoping," "benchtest,")
        read -r m
        st=""
        for i in $m ; do
            st=${st}${arr[$(($i-1))]}
        done
        # st=\"${st%,*}\"
        # echo $st
        # bash ${DIR}/91yuntest.sh -i "io,bandwidth,chinabw,download,traceroute,backtraceroute,allping,gotoping,benchtest"
        bash ./test.sh -i $st
        break
        ;;
    6)
        while [ ! -f ${DIR}/ZBench-CN.sh ]; do
            wget -N -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/FunctionClub/ZBench/master/ZBench-CN.sh
        done
        bash ${DIR}/ZBench-CN.sh
        break
        ;;
    7)
        while [ ! -f ${DIR}/superbench2.sh ]; do
            wget -N -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/zzycwmx/CDN/master/superbench2.sh
        done
        bash ${DIR}/superbench2.sh
        break
        # clear
        # out0 p "原作者已删除该脚本，请重新选择\n"
        ;;
    8)
        while [ ! -f ${DIR}/unixbench.sh ]; do
            wget -P ${DIR} --no-check-certificate https://github.com/teddysun/across/raw/master/unixbench.sh && chmod +x ${DIR}/unixbench.sh
        done
        ${DIR}/unixbench.sh
        break
        ;;
    9)
        while [ ! -d ${DIR}/Geekbench-5.2.3-Linux ]; do
            wget -P ${DIR} http://cdn.geekbench.com/Geekbench-5.2.3-Linux.tar.gz && tar -xzvf ${DIR}/Geekbench-5.2.3-Linux.tar.gz -C ${DIR}
        done
        ${DIR}/Geekbench-5.2.3-Linux/geekbench5
        break
        ;;
    10|16)
        if [ ! -f ${DIR}/kos ]; then
            wget -q kos.f2k.pub -O ${DIR}/kos
        fi
        sh ${DIR}/kos
        break
        ;;
    11)
        if [ $release == "centos" ]; then
            yum install wget -y
            yum groupinstall "Development Tools" -y
        else
            apt-get -y update
            apt-get install wget build-essential -y
        fi
        while [ ! -f ${DIR}/memtester.cpp ]; do
            wget --no-check-certificate -P ${DIR} https://raw.githubusercontent.com/FunctionClub/Memtester/master/memtester.cpp
        done
        while [ ! -f ${DIR}/memtester.out ]; do
            g++ -l stdc++ ${DIR}/memtester.cpp -o ${DIR}/memtester.out
        done
        ${DIR}/memtester.out
        break
        ;;
    12)
        if [ $release == "centos" ]; then
            yum install epel-release -y
            yum install sysbench -y
            sysbench cpu run
        else
            apt-get install sysbench
            sysbench cpu run
        fi
        break
        ;;
    13)
        if [ $release == "centos" ]; then
            yum install wget unzip -y
        else
            apt-get -y update
            apt-get install wget unzip -y
        fi
        while [ ! -f ${DIR}/besttrace ]; do
            wget https://cdn.ipip.net/17mon/besttrace4linux.zip && unzip besttrace4linux.zip -d ${DIR}/ && rm -f besttrace4linux.zip
            chmod +x ${DIR}/besttrace
        done
        read -p "请输入目标IP:" ip
        ${DIR}/besttrace -q 1 ip
        break
        ;;
    14)
        rm -f ${DIR}/memtester*
        rm -f ${DIR}/kos
        rm -f ${DIR}/superbench*
        rm -f ${DIR}/ZBench-CN.sh
        rm -f ${DIR}/LemonBench.sh
        rm -f ${DIR}/*speed*
        rm -f ${DIR}/ip_info.py
        rm -f ${DIR}/Geekbench-5.2.3-Linux.tar.gz
        rm -rf ${DIR}/91yuntest*
        rm -rf ${DIR}/speedtest_original.py
        rm -rf ${DIR}/ip_info.py
        rm -rf ${DIR}/speedtest.tgz
        rm -rf ${DIR}/test*
        rm -rf ${HOME}/superbench.log
        rm -rf ${HOME}/KOS*
        rm -rf ${HOME}/kos*
        rm -rf ${HOME}/superbench_log
        clear
        out0 p "清理完成\n"
        ;;
    15)
        rm -rf ${DIR}
        rm -rf ${HOME}/superbench.log
        rm -rf ${HOME}/KOS*
        rm -rf ${HOME}/kos*
        rm -rf ${HOME}/superbench_log
        clear
        out0 p "清理完成\n"
        ;;
    *)
        clear
        out0 p "请重新选择\n"
esac
done
cl
