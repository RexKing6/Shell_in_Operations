#!/bin/sh
#	***************************************************
#		^> File Name: check_server.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/08/11 - 18:33:53
#	***************************************************

resettem=$(tput sgr0)
Nginxserver='http://115.28.168.74/'
Check_Nginx_Server()
{
	Status_code=$(curl -m 5 -s -w %{http_code} ${Nginxserver} -o /dev/null)
	if [ $Status_code -eq 000 -o $Status_code -ge 500 ];then
		echo -e '\E[32m' "check http server error! Response status code is" $Resettem $Status_code
	else
		Http_content=$(curl -s ${Nginxserver})
		echo -e '\E[32m' "check http server ok! \n" $Resettem $Http_content
	fi
}
Check_Nginx_Server
