#!/bin/bash
# filename: redis-montior.sh

BIN="/usr/local/bin/redis-cli"
IP=$(ip addr show eth1 | awk '/inet/{print $2}' | cut -d/ -f1)
PORT=7000

if [[ $# == 1 ]];then
    case $1 in
        used_memory)
            result=`${BIN} -h $IP -p $PORT info | awk -F: '/used_memory:/{print $2}'`
            echo $result
        ;;
        max_memory)
            result=`${BIN} -h $IP -p $PORT info | awk -F: '/maxmemory:/{print $2}'`
            echo $result
        ;;
        *)
            echo -e "\033[33mUsage: `basename $0 .sh` used_memory | max_memory. \033[0m" 
        ;;
    esac
fi
