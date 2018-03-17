#!/bin/sh
echo "Are you sure?"
echo "Press ENTER to continue or CTRL-C to exit"
read c

git reset --hard
git clean -Xf
git clean -df
