#!/bin/bash
# force to umount network disk

echo "Wait until umount network disk is finish..."
umount -l /net/*
echo "Done!"

