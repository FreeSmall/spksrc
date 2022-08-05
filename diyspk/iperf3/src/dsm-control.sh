#!/bin/sh

daemon_status()
{
  `ps -eLf | awk '($3=="1"){ print}' | grep iperf3`
}

start_daemon()
{
  `iperf3 -s -D`
}

stop_daemon()
{
  `killall iperf3`
}

case $1 in
    start)
        start_daemon
        exit 0
        ;;
    stop)
        stop_daemon
        exit 0
        ;;
    status)
        daemon_status
        exit 0
        ;;
    log)
        exit 1
        ;;
    *)
        exit 1
        ;;
esac
