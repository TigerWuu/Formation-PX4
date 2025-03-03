# PX4: Fixed-Wing UAV Formation Flight 
A customized PX4-Autopilot for fixed-wing UAVs formation flight.

_**Key features**_: 
1. Enable airspeed command under offboard mode.
2. Control pitch ($\theta$) and heading ($\psi$) angle of a fixed-wing UAV at the same time.
3. Receive true wind velocity from Gazebo to calculate the true airspeed (Bug fixed) 
## Contents

* [Requirements](#requirements)
* [Installation](#installation)
* [Joysticks Control](#joysticks-control)
* [Formation Control](#formation-control)
    * [Single-UAV](#single-uav)
    * [Multi-UAV](#multi-uav)
* [Data Visualization](#data-visualization)
* [Tools](#tools)
  
## Requirements
* Ubuntu 22.04 LTS
* Gz sim Garden 7.9.0
* ROS2 humble
  
## Installation
* Install [**PX4 formation simulation package**](https://github.com/TigerWuu/PX4_formation_sim)

* Install **PX4 Autopilot**
  ```
  cd ~/
  git clone git@github.com:TigerWuu/Formation-PX4.git --recursive
  mv ~/Formation-PX4 ~/PX4-Autopilot
  bash ./PX4-Autopilot/Tools/setup/ubuntu.sh
  cd PX4-Autopilot/
  make px4_sitl
  ```
* Install [**QGroundControl**](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)
  
## Joysticks Control
For Xbox one
* Run 

  `ros2 launch control joy.xml`
* Joystick command mapping

  ![image](https://github.com/user-attachments/assets/5789e5ca-24fc-45f7-89b3-0c15c94bb95f)

## Formation Control
Open QGroundControl

`./QGroundControl.AppImage `
### Single-UAV
1. Terminal 1
   
    `cd ~/PX4-Autopilot`
  * w/ Gazebo gui
    
    `make px4_sitl gz_standard_vtol{world}`
  
  * w/o Gazebo gui
  
    `HEADLESS=1 make px4_sitl gz_standard_vtol{world}`
    >  **world lists** :
    > 
    >  _default : w/o wind field
    >  
    >  _windyGust : w/ wind field
    >
2. Terminal 2
   
   `MicroXRCEAgent udp4 -p 8888`
   
3. Terminal 3

   `ros2 launch commander formation.xml wind_com:=w2 L_dir:=0.0 trajectory:=C L:=1.0 L2:=0.1 radii:=400.0`
   
    **Arguments** :
    * _wind_com_: `w1`, `w2`, `none`. wind compensation setting.
    * _L_dir_: straight line formation flight heading angle [rad].
    * _trajectory_ : `C`, `L`. `C` means circular orbit, `L` means straight line.
    * _L_: observer gain L1.
    * _L2_: observer gain L2.
    * _radii_: circular orbit formation flight radius [m].

### Multi-UAV
1. Terminal 1
   
    `cd ~/PX4-Autopilot`
   
  * w/ Gazebo gui
    
    `./px4_multi_uav.sh {world}`
  
    >  **world lists** :
    > 
    >  default : w/o wind field
    >  
    >  windyGust : w/ wind field
    >
   
2. Terminal 5

   `ros2 launch commander formation_multi.xml wind_com:=w2 L_dir:=0.0 trajectory:=C L:=1.0 L2:=0.1 radii:=400.0 leader:=0`

   **Arguments** :
   * _leader_: `0`, `1`. `0` means all three follower UAVs will maintain a certain configuration with the virtual leader. `1 `means only the first follower UAV maintain a configuration with virtual leader, and the other followers maintain the configuration with the first follower UAV, that is, the first follower UAV will be designated as a real leader.
 
## Data Visualization
1. Plot with Matlab
   
    See https://github.com/TigerWuu/Fixed-Wing-Formation-Control
2. Plot with real time
   
    `ros2 run plotjuggler plotjuggler
`
## Tools
1. ros2 bag
2. Plotjuggler
