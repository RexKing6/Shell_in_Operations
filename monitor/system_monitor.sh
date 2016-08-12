#!/bin/sh
#	***************************************************
#		^> File Name: system_monitor.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/08/10 - 19:40:26
#	***************************************************

clear
if [[ $# -eq 0 ]]
	then
# Define Variable reset_terminal
	reset_terminal=$(tput sgr0)

# Check OS Type
	os=$(uname -o)
	echo -e '\E[32m'"Operating System Type :" $reset_terminal $os
# Check OS Release Version and Name
	os_name=$(cat /etc/issue | grep -e "Server")
	echo -e '\E[32m'"Check OS Release Version and Name :" $reset_terminal $os_name
# Check Architecture
	architecture=$(uname -m)
	echo -e '\E[32m'"Check Architecture" $reset_terminal $architecture
# Check Kernel Release
	kernelrelease=$(uname -r)
	echo -e '\E[32m'"Check Kernel Release" $reset_terminal $kernelrelease
# Check hostname $HOSTNAME
# Check Internal IP
	internalip=$(hostname -I)
	echo -e '\E[32m'"Check Internal IP" $reset_terminal $internalip
# Check External IP
	externalip=$(curl -s http://ipecho.net/plain)
	echo -e '\E[32m'"Check External IP" $reset_terminal $externalip
# Check DNS
	nameservers=$(cat /etc/resolv.conf | grep -E "\<nameserver[ ]+" | awk '{print $NF}')
	echo -e '\E[32m'"Check DNS" $reset_terminal $nameservers
# Check if connected to Internet or not
	ping -c 2 baidu.com &> /dev/null && echo "Internet:Connected" || echo "Internet:Disconnected"
# Check Logged In Users
	who>/tmp/who
	echo -e '\E[32m' "Logged In Users" $reset_terminal && cat /tmp/who
	rm -f /tmp/who

	system_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo )
	apps_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
	echo -e '\E[32m'" system memuserages " $reset_terminal $system_mem_usages
	echo -e '\E[32m'" apps memuserages " $reset_terminal $apps_mem_usages
	loadaverage=$(top -n 1 -b|grep "load average:"|awk '{print $12 $13 $14}')
	echo -e '\E[32m'"load average:" $reset_terminal $loadaverage
	diskaverage=$(df -hP|grep -vE 'Filesystem|tmpfs'|awk '{print $1 " " $5}')
	echo -e '\E[32m'" disk averages " $reset_terminal $diskaverage
fi
