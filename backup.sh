#!/bin/bash
#
## My backup script
#

# make /backup directory first
echo "=====:=====:===== BackingUP =====:=====:====="
sudo rsync -aAXHv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/swap/*","/lost+found/*","/home/*"} / /backup/
