# Base docker image
FROM ubuntu:18.04
RUN pwd
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install gawk git   
RUN apt-get -y install xterm
RUN apt-get -y install build-essential

RUN apt-get -y install curl 
RUN apt-get -y install vim 
RUN apt-get -y install wget tmux 

######## python3 ##########

RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get -y update

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
