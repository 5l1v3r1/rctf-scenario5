FROM ros:kinetic-ros-base-xenial

MAINTAINER Lander Usategui <lander@aliasrobotics.com>

COPY scenario5-local /root/ros_catkin_ws/src/scenario5l

RUN /bin/bash -c "cd /root/ros_catkin_ws \
  && source /opt/ros/kinetic/setup.bash \
  && catkin_make_isolated --install --install-space /opt/ros/kinetic \
  && cd && rm -r /root/ros_catkin_ws \
  && rm -rf /opt/ros/kinetic/bin/rostopic \
  && apt-get update && apt-get install -y tcpdump \
  && rm -rf /var/lib/apt/lists/*"

COPY motd /etc/motd

RUN echo "cat /etc/motd" >> /root/.bashrc

COPY launch_script.bash /root/

ENTRYPOINT ["/root/launch_script.bash"]
