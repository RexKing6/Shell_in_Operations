#!/bin/sh
#	***************************************************
#		^> File Name: rename.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/05/28 - 09:52:50
#	***************************************************

read -p "Please input the source file name: " source
read -p "Please input the target file name: " target
mv $source $target
