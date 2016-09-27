#!/bin/bash
gnome-terminal -x $PWD/serial_xml/serialport.bash
source /opt/ros/jade/setup.bash
source /usr/local/serial/setup.bash
source /home/$USR/ivpt/devel/setup.bash
roslaunch /home/$USR/ivpt/src/launch/start.launch
