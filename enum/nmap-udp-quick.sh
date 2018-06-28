#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: nmap-udp-quick.sh <TARGET> <OUTPUT-FILENAME>"
    exit 1
fi

nmap -Pn --top-ports 1000 -sU --stats-every 3m --max-retries 1 -T3 -oA $2 $1