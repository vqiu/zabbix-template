#/bin/bash
# 文件名: dns_monitor_discovery.sh

### API 格式范例

# VIP			用户的二级域名		cname_idc

#183.2.194.3	demo.com		demo-com.2ddos.com_dg
#183.2.194.3	n2.demo.com		n2-demo-com.2ddos.com_dg
#183.2.194.3	t0.demo.com		t0-demo-com.2ddos.com_dg
#183.2.194.3	t1.demo.com		t1-demo-com.2ddos.com_dg
#183.2.194.3	t2.demo.com		t2-demo-com.2ddos.com_dg

### 定义变量

API_URL="$1"                                   # DDoS 接口地址
HASH=$(echo ${API_URL}|md5sum|cut -b1-12)      # 随机生成数
API_FILE_PATH=/tmp/zbx_dns_${HASH}             # API 文件完整路径


# 域名输入判断，没有输入则退出
: ${1?echo "Error: Please enter your domain name"}

curl -s -B ${API_URL}|sed 's/ \+/ /g'|awk '{print $2}'|sort|uniq > ${API_FILE_PATH}

num=$(cat ${API_FILE_PATH}|wc -l)
printf '{\n\t"data":[ '
cat ${API_FILE_PATH}|while read LINE
do
	NAME=$(echo $LINE |awk '{print $1}')
	DOMAIN=$(echo $LINE |awk '{print $1}')
	printf '\n\t\t{'
	printf "\n\t\t\t\"{#NAME}\":\"${NAME}\","
	printf "\n\t\t\t\"{#DOMAIN}\":\"${DOMAIN}\"\n\t\t}"
	((num--))
    [ "$num" == 0 ] && break
    printf ","
done
printf '\n\t]\n'
printf '}\n'

### API数据处理结果
#{
#	"data":[ 
#		{
#			"{#NAME}":"demo.com",
#			"{#DOMAIN}":"demo.com"
#		},
#		{
#			"{#NAME}":"n2.demo.com",
#			"{#DOMAIN}":"n2.demo.com"
#		},
#		{
#			"{#NAME}":"t0.demo.com",
#			"{#DOMAIN}":"t0.demo.com"
#		},
#		{
#			"{#NAME}":"t1.demo.com",
#			"{#DOMAIN}":"t1.demo.com"
#		},
#		{
#			"{#NAME}":"t2.demo.com",
#			"{#DOMAIN}":"t2.demo.com"
#		}
#	]
#}

