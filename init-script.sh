#!/bin/sh

# Quick start-stop-daemon example, derived from Debian /etc/init.d/ssh
set -e

# Must be a valid filename
NAME=scriptname
PIDFILE=/var/run/$NAME.pid
#This is the command to be run, give the full pathname
DAEMON=/usr/bin/scriptname
DAEMON_ARGS=""

export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"

case "$1" in
  start)
        echo -n "Starting daemon: "$NAME
    start-stop-daemon --start --background --quiet --make-pidfile --pidfile $PIDFILE --startas /bin/bash -- -c "exec $DAEMON $DAEMON_ARGS > /var/log/$NAME.log 2>&1"
        echo "."
    ;;
  stop)
        echo -n "Stopping daemon: "$NAME
    start-stop-daemon --stop --quiet --oknodo --pidfile $PIDFILE
        echo "."
    ;;
  restart)
        echo -n "Restarting daemon: "$NAME
    start-stop-daemon --stop --quiet --oknodo --retry 30 --pidfile $PIDFILE
    start-stop-daemon --start --background --quiet --make-pidfile --pidfile $PIDFILE --startas /bin/bash -- -c "exec $DAEMON $DAEMON_ARGS > /var/log/$NAME.log 2>&1"
    echo "."
    ;;

  *)
    echo "Usage: "$1" {start|stop|restart}"
    exit 1
esac

exit 0
