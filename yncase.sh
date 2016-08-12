#!/bin/sh
#	***************************************************
#		^> File Name: yncase.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/08/09 - 18:46:14
#	***************************************************

#判断用户输入
read -p "Please choose yes/no: " -t 30 cho
case $cho in
	"yes")
		echo "Your choose is yes!"
		;;
	"no")
		echo "Your choose is no!"
		;;
	*)
		echo "Your choose is error!"
		;;
esac
