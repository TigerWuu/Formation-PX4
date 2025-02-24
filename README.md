# PX4: Fixed-Wing UAV Formation Flight 

## Installation
* Download **PX4 formation simulation package**
* Download **PX4 Autopilot**
## Requirements
* Ubuntu 22.04 LTS
* Gz sim Garden 7.9.0
* ROS2 humble
* PX4 Autopilot v1.15.0 dev
  
## Joysticks Control
## Formation Control
### Single-UAV
1. Terminal 1
   
    `cd ~/PX4-Autopilot`
  * w/ Gazebo gui
    
    `make px4_sitl gz_standard_vtol{world}`
  
  * w/o Gazebo gui
  
    `HEADLESS=1 make px4_sitl gz_standard_vtol{world}`
    >  **world lists** :
    > 
    >  _default
    >  
    >  _windyGust
    >
2. Terminal 2
   
   `MicroXRCEAgent udp4 -p 8888`
   
3. Terminal 3

   `ros2 launch commander formation.xml wind_com:=w2 L_dir:=0.0 trajectory:=C L:=1.0 L2:=0.1 radii:=400.0`
    >  **Arguments** :
    > 
    >  wind_com
    >  
    >  L_dir
    >
    > trajectory
    >
    > L
    >
    > L2
    >
    > radii

### Milti-UAV
1. Terminal 1
   
    `cd ~/PX4-Autopilot`
   
  * w/ Gazebo gui
    
    `./px4_multi_uav.sh {world}`
  
    >  **world lists** :
    > 
    >  default
    >  
    >  windyGust
    >
   
2. Terminal 5

   `ros2 launch commander formation_multi.xml wind_com:=w2 L_dir:=0.0 trajectory:=C L:=1.0 L2:=0.1 radii:=400.0 leader:=0`
    >  **Arguments** :
    >
    > leader
    > 
## Data Visualization

## Tool
1. ros2 bag
2. Plotjuggler
