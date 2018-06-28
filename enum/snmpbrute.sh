#!/bin/bash
# Usage - ./snmpbrute.sh hosts.txt
cat $1 | while read host
do
	echo "Trying ${host}"
	#snmpwalk -c public -v1 ${host}
	snmp-check ${host} -c public
	echo ""
done