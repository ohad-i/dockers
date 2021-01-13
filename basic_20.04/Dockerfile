FROM ubuntu:20.04


FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

######## some base installs ########
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install gawk git
RUN apt-get -y install xterm
RUN apt-get -y install build-essential
RUN apt-get -y install curl
RUN apt-get -y install vim
RUN apt-get -y install wget tmux
RUN apt-get -y install bash-completion
RUN apt-get -y install python3-pip
RUN apt-get -y install ipython3
RUN apt-get -y install locate
RUN apt-get -y install net-tools
RUN apt-get -y install usbutils
RUN apt-get -y install git-cola
RUN apt-get -y install software-properties-common
RUN apt-get -y install libasound-dev
RUN apt-get -y install git g++ cmake libsqlite3-dev
RUN apt-get -y install libi2c-dev libusb-1.0-0-dev
#install graphics dependencies
RUN apt-get -y install libwxgtk3.0-dev freeglut3-dev
RUN apt-get -y install swig

RUN apt-get clean
RUN apt-get autoclean
RUN apt-get autoremove -y

ENV DEBIAN_FRONTEND=

RUN pip3 install numpy
RUN pip3 install scikit-build
RUN pip3 install opencv-contrib-python
RUN pip3 install zmq
RUN pip3 install pyserial
RUN pip3 install scikit-image
RUN pip3 install matplotlib
RUN pip3 install scipy
RUN pip3 install ipdb
RUN pip3 install rpdb

######## user settings ######
RUN apt-get install sudo
RUN useradd -u 1000 docker
RUN echo "docker:docker" | chpasswd
RUN echo "root:root" | chpasswd
RUN echo 'root:Docker!' | chpasswd
RUN echo "docker ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER docker

# All users can use /home/user as their home directory
ENV HOME=/home/docker

WORKDIR /home/docker

####### handle limesdr-mini rules and permissions
RUN sudo usermod -a -G plugdev docker
RUN sudo usermod -aG root docker

RUN sudo chown -R docker:docker /home/docker
