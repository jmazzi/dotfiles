#!/bin/zsh
exit
pidof banshee >/dev/null

if [ "$?" -ne "0"  ]; then
  exit
fi

banshee --query-current-state 2> /dev/null | grep playing >/dev/null
if [ "$?" -eq "0" ]; then
  info=`banshee --query-artist --query-title`
  track=`echo $info | grep ^title: | awk -F : '{print $2}' | sed 's/^\s//'`
  artist=`echo $info | grep ^artist: | awk -F : '{print $2}' | sed 's/^\s//'`

  echo "${artist} - ${track}             "
fi
