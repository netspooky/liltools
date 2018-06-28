#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: nmap-tcp-quick.sh <TARGET> <OUTPUT-FILENAME>"
    exit 1
fi

nmap -Pn -sS --stats-every 3m --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit -T4 -p1-65535 -oA $2 $1