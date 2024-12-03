#!/bin/bash

PX4_SYS_AUTOSTART=4004 PX4_GZ_MODEL_POSE=$1 PX4_SIM_MODEL=standard_vtol PX4_GZ_WORLD=$2 ./build/px4_sitl_default/bin/px4 -i $3



