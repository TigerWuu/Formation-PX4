#!/bin/bash

gnome-terminal --tab -- bash px4_uav.sh "0,0" $1 1
sleep 2.5
gnome-terminal --tab -- bash px4_uav.sh "-2,2" $1 2
sleep 2.5
gnome-terminal --tab -- bash px4_uav.sh "-2,-2" $1 3

gnome-terminal --tab -- MicroXRCEAgent udp4 -p 8888 
