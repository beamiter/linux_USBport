#!/bin/bash
gnome-terminal -x $PWD/serial_xml/serialport.bash
source /opt/ros/jade/setup.bash
source /usr/local/serial/setup.bash

ivptdir=/home/$USER/ivpt/devel/setup.bash
launchdir=/home/$USER/ivpt/src/launch/start.launch

source ${ivptdir}
roslaunch ${launchdir}
