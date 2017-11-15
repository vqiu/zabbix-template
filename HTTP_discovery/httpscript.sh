#!/bin/sh
#### HTTP get monitor for Zabbix ####

# Define Variables #
curl=/usr/bin/curl
md5sum=/usr/bin/md5sum
cut=/usr/bin/cut
grep=/usr/bin/grep
awk=/usr/bin/awk
sed=/usr/bin/sed
date=/usr/bin/date
useragent="Mozilla/5.0 (Windows NT 6.3; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0.0"

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
md5=$(echo $url | $md5sum -t | $cut -b 1-32)
http_result_tmp=/var/www/http/http.$ip.$md5.txt
code="http_code:%{http_code}\ntime_namelookup:%{time_namelookup}\ntime_connect:%{time_connect}\nhttp_connect:%{http_connect}\nnum_connects:%{num_connects}\ntime_starttransfer:%{time_starttransfer}\ntime_total:%{time_total}\nsize_request:%{size_request}\nsize_download:%{size_download}\nspeed_download:%{speed_download}\ncontent_type:%{content_type}\n"
# Define Variables End #

# Functions to return http get speed
function get {
# Define Variables #
        hostname=$(echo $url | $cut -d '/' -f 3 | $cut -d '@' -f 2 | $cut -d ':' -f 1)
        down_url=$(echo $url | $sed "s/$hostname/$ip/g")
        connect_timeout=${4-10}
        #指定超时时间，单位秒，如果没有就默认10秒钟
        time=$($date +"%Y-%m-%d %H:%M:%S")
        date=$($date +"%Y%m%d")
        split="\n----\n"
        #http_log=/var/www/http/$hostname/$date.$ip.txt
        #mkdir -p /var/www/http/$hostname/
        limit_rate=${5-10M}
        #限制传输速度，这个是平均速度，突发速度可能高于此值
#        dx=eth0
#        lt=eth0:1
#        yd=eth0:2
#        case "$6" in
#                dx) interface=$dx ;;
#                lt) interface=$lt ;;
#                yd) interface=$yd ;;
#                *) interface=$6 ;;
#        esac
        #指定出去的IP或者网卡接口，可使用接口名称或者IP
        #请填写Zabbix Agent所在机器的IP
        max_time=20
        #单位秒，允许整个下载操作的最长时间，避免返回数据的时间过长，造成进程一直挂起

        #以下参数暂未启用
        speed_limit=1000
        #单位字节，限制最低传输速度，如果低于该速度达到speed_time的时间，就会终止下载
        speed_time=20
        #单位秒，如果传输速度低于speed_limit达到这个时间，就会终止下载
# Define Variables End #

#下载并保存、输出结果
        http_result=$($curl -o /dev/null -s -w "$code" --connect-timeout $connect_timeout --max-time $max_time --limit-rate $limit_rate --insecure --user-agent "$useragent" -H "Host:$hostname" $down_url)
        #获取http get的结果
        ##echo -ne "$http_result""\nhostname:$hostname\nIP:$ip\nURL:$url""$split""$time""$split" >> $http_log
        #保存到日志里
        echo -ne "$http_result""\nhostname:$hostname\nIP:$ip\nURL:$url""$split""$time""\n" | sed 's/\.000$//g' > $http_result_tmp
        #保存临时文件以供其他进程提取
        #echo -ne "$http_result""\nhostname:$hostname\nIP:$ip\nURL:$url""$split""$time""\n"
        #输出结果给Zabbix Agent

        exit 0
}

get $@
