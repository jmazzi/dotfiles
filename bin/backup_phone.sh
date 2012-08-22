#!/bin/bash
mount | grep /mnt/nexus 2>/dev/null
if [ "$?" != "0" ]; then
  sudo echo
  echo "Attempting to mount"
  sudo umount -l /mnt/nexus 2>/dev/null
  mtpfs /mnt/nexus
  if [ "$?" != "0" ]; then
    echo "We failed!"
    exit 255
  fi
  echo "Success!"
fi

echo "Running rsync"
rsync -av --delete-after --exclude .thumbnails /mnt/nexus/DCIM/ /storage/Pictures/DCIM
rsync -av --delete-after --exclude 'DCIM/' --exclude 'Android/' /mnt/nexus/ /storage/Phone
