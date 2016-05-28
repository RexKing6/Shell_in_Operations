#!/bin/sh
#	***************************************************
#		^> File Name: test1.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/05/28 - 13:47:17
#	***************************************************

File=/etc/fstab

line1=`cat $File | tail -1`
echo $line1
echo 

echo "The uuid is "
uuid=`echo $line1 | awk -F '[= ]+' '{print $2}'`
echo $uuid
echo 

echo "The homedic is"
homedic=`echo $line1 | awk -F '[= ]+' '{print $3}'`
echo $homedic
echo 

echo "The filesys is"
filesys=`echo $line1 | awk -F '[= ]+' '{print $4}'`
echo $filesys
echo 

exit 0
