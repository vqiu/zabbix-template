#!/bin/bash
#
# Filename:    automonitordiskio.sh
# Date:        2015/10/23
# Description: 部署 zabbix low-level discovery 监控磁盘IO
# Notes:       在被监控客户端运行此脚本，前提条件已经安装好 zabbix agent
#

# 相关目录的变量
# 自行修改为你的 zabbix agent 配置文件路径
agent_conf="/usr/local/etc/zabbix_agentd.conf"
scripts_dir="/usr/local/etc/scripts/"

if [[ $(id -u) != "0" ]]; then
    printf "\e[42m\e[31mError: You must be root to run this install script.\e[0m\n"
    exit 1
fi

mkdir -p $scripts_dir

# 创建 low-level discovery mounted disk 脚本
cat > "${scripts_dir}mount.disk.discovery.sh" << 'EOF'
#!/bin/bash
#Function: low-level discovery mounted disk
#Script_name: mount.disk.discovery.sh

mount_disk_discovery()
{
    local regexp="\b(btrfs|ext2|ext3|ext4|jfs|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|ntfs|fat32|zfs)\b"
    local tmpfile="/tmp/mounts.tmp"
    :> "$tmpfile"
    egrep "$regexp" /proc/mounts > "$tmpfile"
    local num=$(cat "$tmpfile" | wc -l)
    printf '{\n'
    printf '\t"data":[ '
    while read line;do
        DEV_NAME=$(echo $line | awk '{print $1}')
        FS_NAME=$(echo $line | awk '{print $2}')
        SEC_SIZE=$(sudo /usr/sbin/blockdev --getss $DEV_NAME 2>/dev/null)
        printf '\n\t\t{'
        printf "\"{#DEV_NAME}\":\"${DEV_NAME}\","
        printf "\"{#FS_NAME}\":\"${FS_NAME}\","
        printf "\"{#SEC_SIZE}\":\"${SEC_SIZE}\"}"
        ((num--))
        [ "$num" == 0 ] && break
        printf ","
    done < "$tmpfile"
    printf '\n\t]\n'
    printf '}\n'
}

case "$1" in
    mount.disk.discovery)
        mount_disk_discovery
        ;;
    *)
        echo "Bad Parameter."
        echo "Usage: $0 mount.disk.discovery"
        exit 1
        ;;
esac
EOF


touch /tmp/mounts.tmp
chown zabbix:zabbix /tmp/mounts.tmp
chown -R zabbix:zabbix "${scripts_dir}"
chmod 755 "${scripts_dir}mount.disk.discovery.sh"

# 判断配置文件是否存在
[ -f "${agent_conf}" ] || { echo "ERROR: File ${agent_conf} does not exist.";exit 1;}

#include=$(grep '^Include' ${agent_conf} | cut -d'=' -f2)
include="/usr/local/etc/zabbix_agentd.conf.d"
# 在配置文件中添加自定义参数
if [ -d "${include}" ]; then
    cat > ${include}/disk_lld.conf << EOF
UserParameter=mount.disk.discovery,/bin/bash ${scripts_dir}mount.disk.discovery.sh mount.disk.discovery
EOF
else
    grep -q '^UserParameter=mount.disk.discovery' ${agent_conf} || cat >> ${agent_conf} << EOF
UserParameter=mount.disk.discovery,/bin/bash ${scripts_dir}mount.disk.discovery.sh mount.disk.discovery
EOF
fi

# 授权 zabbix 用户无密码运行 blockdev 命令
which_blockdev=$(which blockdev)
chmod +w /etc/sudoers
cat >> /etc/sudoers << 'EOF'
Cmnd_Alias ZABBIX = /usr/sbin/fping, /usr/sbin/fping6, /usr/sbin/blockdev, /usr/bin/traceroute, /usr/sbin/mtr
zabbix ALL=(ALL)       NOPASSWD: ZABBIX
EOF

chmod 440 /etc/sudoers

# 重启 agent 服务
systemctl restart zabbix-agent
