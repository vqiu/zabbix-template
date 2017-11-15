#!/bin/bash
# Filename: http.discovery.sh

SRC_URL="$1"
HASH=$(echo "$SRC_URL" | md5sum -t | cut -b 1-32)
SRC_FILE="zabbix_http_${HASH}.txt"

cd /tmp
curl -s -B "$1"|sed 's/ \+/ /g'| grep -P "^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9]) +https?://.* +.*$"|sort|uniq|sort -k3 -u > ${SRC_FILE}

num=$(cat "/tmp/${SRC_FILE}" | wc -l)
printf '{\n\t"data":[ '
cat /tmp/${SRC_FILE} | while read LINE
do
	NAME=$(echo $LINE | awk '{print $3}')
	IP=$(echo $LINE | awk '{print $1}')
	URL=$(echo $LINE | awk '{print $2}')
	printf '\n\t\t{'
	printf "\n\t\t\t\"{#NAME}\":\"${NAME}\","
	printf "\n\t\t\t\"{#IP}\":\"${IP}\","
	printf "\n\t\t\t\"{#URL}\":\"${URL}\"\n\t\t}"
	((num--))
	[[ "$num" == 0 ]] && break
	printf ","
done
printf '\n\t]\n'
printf '}\n'