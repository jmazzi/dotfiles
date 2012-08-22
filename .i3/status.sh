#!/bin/sh
i3status | while :
do
        read line
        network=`~/.i3/network.sh`
        echo "'$network' | $line"
done
