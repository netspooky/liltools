#!/usr/bin/python
import socket
import sys
import time

if len(sys.argv) != 2:
 print "Usage: vrfy.py <username>"
 sys.exit(0)
# Create a Socket

# Connect to the Server
# 
ipz = ['10.11.1.128','10.11.1.227']

for x in ipz:
	s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	connect=s.connect((x,25))
	# Receive the banner
	banner=s.recv(1024)
	print x,
	print (' ---------------')
	print banner
	# VRFY a user
	#s.send('')
	s.send('VRFY ' + sys.argv[1] + '\r\n')
	result=s.recv(1024)
	print result
	# Close the socket
	s.close()