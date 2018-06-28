#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "Usage: nmap-tcp-full.sh <TCP-QUICK-RESULTS.XML> <TARGET> <OUTPUT-FILENAME>"
	exit 1
fi

nmap -nvv -Pn -sSV -T1 -p$(cat $1 | grep portid | grep protocol=\"tcp\" | cut -d'"' -f4 | paste -sd "," -) --version-intensity 9 -A -oA $3 $2
