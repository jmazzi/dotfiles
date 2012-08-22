#!/bin/bash

# path to store the old results in
path="/dev/shm/measure-net-speed"

# grabbing data
eth0="/sys/devices/pci0000:00/0000:00:1c.7/0000:07:00.0/0000:08:06.0/0000:0d:00.0/net/eth0/statistics"
#wlan0="/sys/devices/pci0000:00/0000:00:1c.1/0000:03:00.0/net/wlan0/statistics"
read eth0_rx < "${eth0}/rx_bytes"
read eth0_tx < "${eth0}/tx_bytes"
#read wlan0_rx < "${wlan0}/rx_bytes"
#read wlan0_tx < "${wlan0}/tx_bytes"

# get time and sum of rx/tx for combined display
time=$(date +%s)
#rx=$(( $eth0_rx + $wlan0_rx ))
#tx=$(( $eth0_tx + $wlan0_tx ))

rx=$eth0_rx
tx=$eth0_tx

# write current data if file does not exist. Do not exit, this will cause
# problems if this file is sourced instead of executed as another process.
if ! [[ -f "${path}" ]]; then
  echo "${time} ${rx} ${tx}" > "${path}"
  chmod 0666 "${path}"
fi

# read previous state and update data storage
read old < "${path}"
echo "${time} ${rx} ${tx}" > "${path}"

# parse old data and calc time passed
old=(${old//;/ })
time_diff=$(( $time - ${old[0]} ))

# sanity check: has a positive amount of time passed
if [[ "${time_diff}" -gt 0 ]]; then
  # calc bytes transferred, and their rate in byte/s
  rx_diff=$(( $rx - ${old[1]} ))
  tx_diff=$(( $tx - ${old[2]} ))
  rx_rate=$(( $rx_diff / $time_diff ))
  tx_rate=$(( $tx_diff / $time_diff ))

  # shift by 10 bytes to get KiB/s and by 20 for MiB/s
  # and print the more human readable value.
  # 1024^2 = 1048576

  # incoming
  if [[ "$rx_mib" -gt 1048576 ]]; then
    rx_mib=$(( $rx_rate >> 20 ))
    echo -n "${rx_mib} M↓"
  else
    rx_kib=$(( $rx_rate >> 10 ))
    echo -n "${rx_kib} K↓"
  fi

  echo -n "  "

  # outgoing
  if [[ "$tx_mib" -gt 1048576 ]]; then
    tx_mib=$(( $tx_rate >> 20 ))
    echo -n "${tx_mib} M↑"
  else
    tx_kib=$(( $tx_rate >> 10 ))
    echo -n "${tx_kib} K↑"
  fi
else
  echo -n " ? "
fi
