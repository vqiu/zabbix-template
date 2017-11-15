#!/bin/sh
#### HTTP get monitor for Zabbix ####
#### Author : Travis Lee ####
#### Create : 2013-09-12 ####
#### Version : v0.2.6 build.20141227 ####

#### Change History ####
# 2013-09-12 Version : v0.1.0 build.20130912 简单实现http get功能
# 2013-12-11 Version : v0.2.0 build.20131211 大幅度改进架构，支持更多功能比如时间和http状态码等，引入更多参数比如指定IP域名和URL、超时时间、指定外网IP，支持日志
# 2013-12-26 Version : v0.2.1 build.20131226 修正bug，增加大量注释，增加速度限制功能
# 2013-12-30 Version : v0.2.2 build.20131230 增加IP选项，以便适应更多环境；判断URL参数是否包含http://；修正描述
# 2014-01-14 Version : v0.2.3 build.20140114 增加限速的参数
# 2014-01-24 Version : v0.2.4 build.20140124 增加max-time参数，增加HTTP状态码检测功能
# 2014-12-23 Version : v0.2.5 build.20141223 去掉interface参数（指定外网IP的功能），调整日志文件、临时文件
# 2014-12-27 Version : v0.2.6 build.20141227 修改架构，改成异步模式，降低数据库压力，大幅提高效率；去掉所有命令的标准错误输出，防止Zabbix出现无效数据类型而把项目变成不可用；减少输出结果，节省数据库空间
#### Change History End ####

#使用说明：5个参数，第1个参数指定功能，第2个参数指定被监控的IP，这两个为必须参数；3-5仅在第1个参数为get时需要
#第1个参数：支持参数列表 get、speed、code、connect、starttransfer、totaltime、ip、status
#get是执行get操作并返回全部数据给Zabbix，get参数需要2-5的参数
#status是检查HTTP的状态码，status需要第2、3参数
#speed是获取下载速度
#code是返回的http代码
#connect是连接的时间
#starttransfer是开始传输的时间
#totaltime是总共使用的时间
#ip是指定的IP

#第4-5的参数仅在get功能下有效
#第2个参数：指定访问的服务器IP
#第3个参数：指定访问的URL（使用https需要OpenSSL支持）
#第4个参数：指定超时的时间，单位是秒，如果为空则为10秒
#第5个参数：指定wget的速度平均速度，比如10M，峰值速度可能会超过此限制
#（作废）第6个参数：指定出去的网卡接口，可以使用接口名称比如eth0、eth0:1，也可以使用IP。大多数监控点的电信接口为eth0，联通接口为eth0:1。也可使用dx、lt、yd三个参数，使用这三个参数，需指定dx、lt、yd三个变量的IP或者接口

#HTTP状态码检测需要第2、3参数
#第2个参数：指定访问的服务器IP
#第3个参数：指定访问的URL（使用https需要OpenSSL支持）

# Define Variables #
curl=/usr/bin/curl
md5sum=/usr/bin/md5sum
cut=/usr/bin/cut
grep=/usr/bin/grep
awk=/usr/bin/awk
sed=/usr/bin/sed
date=/usr/bin/date
nohup=/usr/bin/nohup
cat=/usr/bin/cat

function=$1
ip=$2
#目标IP
url=$3
#下载的URL，如果不包含http://，会自动添加，使用https必须指定https://，并且需要OpenSSL支持
#将参数变成需要的URL
if [ "${url:0:4}" != "http" ]
    then
    url="http://""$url"
fi
md5=$(echo "$url" | $md5sum -t | $cut -b 1-32)
http_result_tmp=/var/www/http/http.$ip.$md5.txt
mkdir -p /var/www/http/
# Define Variables End #

# get http result #
case "$function" in
        get)
                $nohup ./httpscript.sh $@ >/dev/null 2>&1 &
                echo OK
                exit 0
                ;;
        http)
                $cat $http_result_tmp 2>/dev/null
                ;;
        speed)
                $awk -F ":" '/speed_download/{print $2}' $http_result_tmp 2>/dev/null | $cut -f1 -d"."
                ;;
        code)
                $awk -F ":" '/http_code/{print $2}' $http_result_tmp 2>/dev/null
                ;;
        connect)
                $awk -F ":" '/time_connect/{print $2}' $http_result_tmp 2>/dev/null
                ;;
        starttransfer)
                $awk -F ":" '/time_starttransfer/{print $2}' $http_result_tmp 2>/dev/null
                ;;
        totaltime)
                $awk -F ":" '/time_total/{print $2}' $http_result_tmp 2>/dev/null
                ;;
        size_download)
                $awk -F ":" '/size_download/{print $2}' $http_result_tmp 2>/dev/null
                ;;
        ip)
                $awk -F ":" '/IP/{print $2}' $http_result_tmp 2>/dev/null
                ;;
        hostname)
                $awk -F ":" '/hostname/{print $2}' $http_result_tmp 2>/dev/null
                ;;
        url)
                $awk -F ":" '/URL/{print $2":"$3}' $http_result_tmp 2>/dev/null
                ;;
        status)
                ip=$2
                url=$3
                useragent="Mozilla/5.0 (Windows NT 6.3; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0.0"
                if [ "${url:0:4}" != "http" ]
                        then
                        url="http://""$url"
                fi
                hostname=$(echo $url | $cut -d '/' -f 3 | $cut -d '@' -f 2 | $cut -d ':' -f 1)
                down_url=$(echo $url | $sed "s/$hostname/$ip/g")
                $curl -o /dev/null -s -w "%{http_code}\n" --max-time 10 --insecure --user-agent "$useragent" -H "Host:$hostname" $down_url
                ;;
esac

exit 0


if false; then
http_code:200
time_namelookup:0
time_connect:0.012
http_connect:000
num_connects:1
time_starttransfer:3.293
time_total:3.293
size_request:135
size_download:885
speed_download:268
content_type:text/html
hostname:fhb.wy.cn
IP:14.17.64.1
URL:http://fhb.wy.cn
-------------------
2014-12-27 02:14:21
fi
