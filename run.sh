#!/bin/bash

SEND_DIR="$HOME/.send"
SEND_CONF="$SEND_DIR/send.conf"
USER="send"
SUDO="sudo -iu send"

usage() {
	[ -z "$1" ] || echo "$1"
	echo "Usage: docker run -v /path/to/send-config-dir:/home/send/.send [-d|-it] bram/socialsend"
	echo "If you specify a non-existing <send-config-dir> it will be created and populated."
	exit -1
}

die() {
	echo "Error: $1"
	exit -1
}

start_sendd() {
	PIDOF="$(pidof $SEND_DIR/sendd)" 
	PIDFILE="$(cat $SEND_DIR/sendd.pid 2>/dev/null)" 
	[ ! -z "$PIDOF" ] && return 0
	[ -z "$PIDOF" ] && [ ! -z "$PIDFILE" ] && die "PID file exists, might belong to an old process or you are sharing your send config dir which is not recommended. Fix it. Aborting." 

	$SUDO sendd -printtoconsole
}

feedback_loop() {
	echo "Started "
	while true; do echo -n .;sleep 20;done
	echo "Ending."
}
			
[[ "$1" =~ "(-h|--help|)$" ]] && usage

[ ! -d "$SEND_DIR" ] && usage "Error: No send conf/data dir found, make sure to mount a directory on $SEND_DIR"

chown -R send $SEND_DIR

[ ! -r "$SEND_CONF" ] && {
	$SUDO sendd -daemon 2>&1|grep '^rpc' >> $SEND_CONF
	$SUDO cat >> $SEND_CONF << "EOF"
pcallowip=127.0.0.1
staking=1
server=1
listen=1
daemon=1
logtimestamps=1
maxconnections=256
#masternode=1
#masternodeprivkey=
EOF
} 

[ -r "$SEND_CONF" ] || die "No config file found, did you or some process move it? Rerun me."
start_sendd
feedback_loop
