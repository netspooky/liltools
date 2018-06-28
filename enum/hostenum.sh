#!/bin/bash

# This script is for automating DNS queries 
for server in $(seq 254); do
	host -l 10.11.1.$server 10.11.1.220 | grep local &
done
