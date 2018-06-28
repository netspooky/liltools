#!/bin/sh
echo "Who are you and what can you do?"
whoami
groups
echo ""
echo "[+] Distro ---------------------------------------------------------------------"
cat /etc/issue /etc/*-release
echo ""

echo "[+] Kernel Version -------------------------------------------------------------"
uname -a
echo ""

echo "[+] Users ----------------------------------------------------------------------"
cat /etc/passwd /etc/group
echo ""

echo "[+] Environment ----------------------------------------------------------------"
#cat /etc/profile /etc/bashrc ~/.bash_profile ~/.bashrc ~/.bash_logout; 
env; set
echo ""

echo "[+] What is running as root? ---------------------------------------------------"
ps -auxxx | grep root
echo ""

echo "[+] What applications are installed? -------------------------------------------"
dpkg -l
rpm -qa
echo ""

echo "[+] Conf Files -----------------------------------------------------------------"
# If you get redirect errors then take out 2> /dev/null
find /etc/ -name *.conf 2> /dev/null
echo ""

echo "[+] What jobs are scheduled? ---------------------------------------------------"
# If you get redirect errors then take out 2> /dev/null
crontab -l
ls -alh /var/spool/cron
ls -al /etc/cron* 2> /dev/null
cat /etc/cron* 2> /dev/null
echo "" 

echo "[+] What NIC(s) does the system have? ------------------------------------------"
echo ">>> Hostname"
hostname
echo ">>> Network Interfaces:"
/sbin/ifconfig -a
echo ">>> Routing info:"
/sbin/route
echo ">>> ARP Cache:"
arp -a 
echo ">>> Current Network Connections:"
netstat -antup
echo ""

echo "[+] What sudo commands can be ran? ----------------------------------------------"
sudo -l 2> /dev/null
echo ""
cat /etc/sudoers
echo ""

echo "[+] Home Directories ------------------------------------------------------------"
# If you get redirect errors then take out 2> /dev/null
echo ">>> /root/"
ls -ahl /root/ 
echo ""
echo ">>> /home/"
ls -ahl /home/ 
echo "*** NOTE: Check for .bash_history files for clues, .ssh directories/keys and hidden directories/files for more clues..."
echo ""

echo "[+] Can private-key information be found? ---------------------------------------"
find /home/ -name authorized_keys 2> /dev/null
echo ""
find /home/ -name id_* 2> /dev/null
echo ""
find /root/ -name authorized_keys 2> /dev/null
echo ""
find /root/ -name id_* 2> /dev/null
echo ""
ls -lah /root/.ssh/ 2> /dev/null
echo ""

echo "[+] Anything in webroot? --------------------------------------------------------"
ls -alh /var/www/
echo ""

echo "[+] Are there any unmounted file-systems? --------------------------------------"
cat /etc/fstab
echo ""

echo "[+] Finding SUID and GUID files... ---------------------------------------------"
find / -type f \( -perm -04000 -o -perm -02000 \) -exec ls -lh {} \; 2> /dev/null
# echo ""
# For freebsd
# find / -xdev -user root \( -perm -4000 -o -perm -2000 \)
echo ""

echo "[+] Looking for more creds -----------------------------------------------------"
grep -rnw '/' -ie 'pass'
grep -rnw '/' -ie 'DB_PASS'
grep -rnw '/' -ie 'DB_PASSWORD'
grep -rnw '/' -ie 'DB_USER'
echo ""

echo "[+] What development tools/languages are installed/supported? ------------------"
which perl
which gcc
which g++
which python
which php
which cc
which go
which node
echo ""

echo "[+] How can files be uploaded? ------------------------------------------------"
which wget
which nc
which netcat
which scp
which ftp
which tftp
which curl
echo ""
echo "---------------------------------------------------------------------"
echo "Done!"
echo ""
echo "[!] If commands are limited, you break out of the jail shell? -------------------"
echo "python -c 'import pty;pty.spawn("/bin/bash")'"
echo "echo os.system('/bin/bash')"
echo "/bin/sh -i"
echo ""
