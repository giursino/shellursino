#!/bin/bash
# force to umount network disk

echo "Wait until umount network disk is finish..."
CIFS=$(mount | grep cifs | awk '{ print $3 }')
echo $CIFS
sudo umount -l ${CIFS}
echo "Done!"

