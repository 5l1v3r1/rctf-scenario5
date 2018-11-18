#!/bin/bash

source /opt/ros/kinetic/setup.bash

roscore &
sleep 4
rosrun scenario5 talker &
rosrun scenario5 listener &
bash
