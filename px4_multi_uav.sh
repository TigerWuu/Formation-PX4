#!/bin/bash

gnome-terminal --tab -- bash px4_uav.sh "0,0,0,0,0,1.57" $1 1
sleep 2.5
gnome-terminal --tab -- bash px4_uav.sh "-3,-3,0,0,0,1.57" $1 2
sleep 2.5
gnome-terminal --tab -- bash px4_uav.sh "3,-3,0,0,0,1.57" $1 3

gnome-terminal --tab -- MicroXRCEAgent udp4 -p 8888 
