# 安装python3一键脚本
# 适用系统 CentOS
# Python3版本：3.8.2

# 安装编译Python3源文件所需的编译环境
yum install -y gcc
yum install -y zlib*
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

# 下载并解压Python文件
wget http://cdn.npm.taobao.org/dist/python/3.8.2/Python-3.8.2.tgz
tar -zxvf Python-3.8.2.tgz
cd Python-3.8.2/

# 指定安装目录
./configure --prefix=/usr/local/python3 --with-ssl

# 编译并安装
make
make install

# 建立软链接
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

# 清理文件
cd ..
rm -rf Python-3.8.2/ Python-3.8.2.tgz

echo "安装完成."
echo "安装目录：/user/local/pyhton3"