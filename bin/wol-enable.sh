#!/bin/sh
INTERFACE=eno1
ethtool -s $INTERFACE wol g
OUT=$(ethtool eno1 | grep -e "Wake-on: .$")

logger -t 'wakeonlan init script' "enabling wake on lan for $INTERFACE (status: ${OUT})"
