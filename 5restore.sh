#!/bin/bash
#
## My restore backup script
#

echo "=====:=====:===== Restoring Backup =====:=====:====="
sudo rsync -aAXHv --exclude="lost+found" /mnt/backup/ /mnt
