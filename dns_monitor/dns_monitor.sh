#!/bin/bash
# 文件名: DNS 检查脚本
# 功能: 监控 DDoS 平台客户域名解析状态
#　作者: haibin@2016

domain=$1
server=${2-223.5.5.5}
timeout=${3-2}
host="/usr/bin/host"

if test -z "$1" ; then
    echo 9;
    exit 0;
fi

# 判断条件及输出数据：
# 2ddos.com 有2个或以上 --> 解析到我们平台，并且解析正常 --> 输出 0
# 2ddos.com 只有1个 --> dns.com 出错 --> 输出 1
# no A record 或者 not found --> 用户没有解析这个域名 --> 输出 2
# connection timed out; no servers could be reached --> 用户 DNS 出错 --> 输出 3
# 不含有 2ddos.com --> 用户没有解析到我们平台 --> 输出 4
# 其他情况 --> 未知错误 --> 输出 9

result=$($host -t A -W $timeout $domain $server 2>&1)

a=$(echo -e "$result" | grep -c "2ddos.com")
b=$(echo -e "$result" | grep -c -E "no A record|not found")
c=$(echo -e "$result" | grep -c "connection timed out")
if [ $a -ge 2 ] ; then
    echo 0;
    exit 0;
elif [ $a -eq 1 ] ; then
    echo 1;
    exit 0;
elif [ $b -ge 1 ] ; then
    echo 2;
    exit 0;
elif [ $c -ge 1 ] ; then
    echo 3;
    exit 0;
elif [ $a -eq 0 ] ; then
    echo 4;
    exit 0;
else
    echo 9;
    exit 0;
fi

exit 0
