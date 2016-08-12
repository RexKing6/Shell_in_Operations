#!/bin/sh
#	***************************************************
#		^> File Name: targz.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/08/09 - 19:00:01
#	***************************************************

cd /root/test
ls *.tar.gz > ls.log
ls *.tgz >> ls.log
for i in $(cat ls.log)
	do
		tar -zxf $i &> /dev/null
	done
rm -rf /lamp/ls.log
