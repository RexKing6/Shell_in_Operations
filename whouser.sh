#!/bin/sh
#	***************************************************
#		^> File Name: whouser.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/08/09 - 07:39:26
#	***************************************************

test=$(env | grep USER | cut -d "=" -f 2)

if [ "$test" == "root" ];then
	echo "User is root."
fi
