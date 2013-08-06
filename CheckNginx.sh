#!/bin/bash
# 定时检查 memcached 进程，如不存在则重启
# copy @ Chuanwen Chen 2013/8/5

TARGET='/usr/local/memcached/bin/memcached -d -m 1024 -c 4096 -l 192.168.0.1 -p 11211 -u root'
INTERVAL=5

while true

do

    pid=`/bin/ps -ef | grep 'memcached -d ' | grep 11211 | grep -v grep | awk '{print $2}'`

    if [ -n "$pid" ]
    then
        echo $pid
    else
        $TARGET
    fi

    sleep $INTERVAL

done
