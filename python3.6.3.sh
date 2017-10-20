#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
Green_font="\033[32m" && Red_font="\033[31m" && Font_suffix="\033[0m"
Info="${Green_font}[Info]${Font_suffix}"
Error="${Red_font}[Error]${Font_suffix}"
echo -e "${Green_font}
#======================================
# Project: python
# Version: 3.6.3
# Author: nanqinlang
# Blog:   https://www.nanqinlang.com
# Github: https://github.com/nanqinlang
#======================================${Font_suffix}"

#check system
check_system(){
	cat /etc/issue | grep -q -E -i "debian" && release="debian"

	if [[ "${release}" = "debian" ]]; then
		echo -e "${Info} system is debian "
		else echo -e "${Error} not support!" && exit 1
	fi
}

#check root
check_root(){
	if [[ "`id -u`" = "0" ]]; then
	echo -e "${Info} user is root"
	else echo -e "${Error} must be root user" && exit 1
	fi
}

#required workplace directory
directory(){
	[[ ! -d /home/python3.6.3-installation ]] && mkdir -p /home/python3.6.3-installation
	cd /home/python3.6.3-installation
}

check_system
check_root
directory
apt-get update && apt-get install -y build-essential zlibc zlib1g-dev
wget https://raw.githubusercontent.com/nanqinlang/python3/master/Python-3.6.3.tar.gz && tar -zxf Python-3.6.3.tar.gz
./configure --prefix=/home/python3.6.3 --enable-optimizations
make && make install

/home/python3.6.3/bin/python3 --version