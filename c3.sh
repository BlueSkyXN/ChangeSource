rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install cpulimit -y
curl -s -L http://download.c3pool.com/xmrig_setup/raw/master/setup_c3pool_miner.sh | LC_ALL=en_US.UTF-8 bash -s 49c5wkbcbKVj2NFh1BEWW8er2wbQpuqvpHxjnZj9o9u9hpXPKKNdUWJUBoE3n7jYjpT81dLsuhUWkLmchaWPJ2zK7dLK14R
