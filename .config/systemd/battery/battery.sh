#!/usr/bin/env bash

NOTIFICATIONFILE=/tmp/batterymonitornotification

if [ ! -f $NOTIFICATIONFILE ]; then
   echo "0" > $NOTIFICATIONFILE
fi

read -r NOTIFICATIONSENT < $NOTIFICATIONFILE

read -r BAT < /sys/class/power_supply/BAT1/capacity

if ! systemd-ac-power; then
   if [ $BAT -le 10 ] && [ $NOTIFICATIONSENT -ne 10 ]; then
      notify-send -u critical "Extremely Low Battery!" "$BAT% Remaining."
      sed -i 's/.*/10/' $NOTIFICATIONFILE
   elif [ $BAT -le 20 ] && [ $NOTIFICATIONSENT -ne 20 ]; then
      notify-send -u normal "Low Battery" "$BAT% Remaining."
      brightnessctl -s set 100
      sed -i 's/.*/20/' $NOTIFICATIONFILE
   fi
else
   if [[ $NOTIFICATIONSENT -ne 21 ]]; then
      brightnessctl -s set 300
      sed -i 's/.*/21/' $NOTIFICATIONFILE
   fi
fi
