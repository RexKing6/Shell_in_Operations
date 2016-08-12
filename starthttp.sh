#!/bin/sh
#	***************************************************
#		^> File Name: starthttp.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/08/09 - 17:53:01
#	***************************************************

test = $( ps aux | grep httpd | grep -v grep)
#截取httpd进程，并把结果赋予变量test
if [ -n "$test" ]
#如果test的值不为空，则执行then中命令
	then
		echo "$(date) httpd is ok!" >> /tmp/autostart-acc.log
	else
		/etc/rc.d/init.d/httpd start &>/dev/null
		echo "$(date) restart httpd !!" >> /tmp/autostart-err.log
fi
