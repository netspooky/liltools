import socket
import sys
if len(sys.argv) != 3:
  print "Usage: smtpvrfy.py <host> <user>"
  sys.exit(0)
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connect=s.connect((sys.argv[1],25))
banner=s.recv(1024)
print banner
s.send('VRFY ' + sys.argv[2] + '\r\n')
res=s.recv(1024)
print res
s.close()