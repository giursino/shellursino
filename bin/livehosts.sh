#!/bin/bash

NET="172.20.30.1/24"

nmap $NET -n -sP | grep report | awk '{print $5}'
