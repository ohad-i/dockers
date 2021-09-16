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
RUN apt-get -y install mesa-utils 
RUN apt-get -y install libgl1-mesa-glx


#RUN add-apt-repository -y ppa:gnuradio/gnuradio-releases-3.7
## for latest gnuradio:
RUN apt-get -y install python3-gi gobject-introspection gir1.2-gtk-3.0
RUN add-apt-repository ppa:gnuradio/gnuradio-releases
RUN apt-get update
RUN apt-get -y install gnuradio


ENV DEBIAN_FRONTEND=

ENV WORK_DIR=/home/docker INSTALL_DIR=/opt
WORKDIR ${WORK_DIR}

######## limesdr install ###########
#packages for soapysdr available at myriadrf PPA
RUN add-apt-repository -y ppa:myriadrf/drivers
RUN apt-get update

#install core library and build dependencies
RUN apt-get -y install git g++ cmake libsqlite3-dev

#install hardware support dependencies
RUN apt-get -y install libsoapysdr-dev libi2c-dev libusb-1.0-0-dev

#install graphics dependencies
RUN apt-get -y install libwxgtk3.0-dev freeglut3-dev

#RUN git clone https://github.com/myriadrf/LimeSuite.git \
#    && cd LimeSuite \
#    && git checkout stable \
#    && mkdir builddir && cd builddir \
#    && cmake ../ \
#    && make -j4 \
#    && make install \
#    && ldconfig 

#RUN apt-get -y install gr-limesdr
RUN apt-get -y install swig
#RUN git clone https://github.com/myriadrf/gr-limesdr.git \
#    && cd gr-limesdr \
#    && mkdir build \
#    && cd build \
#    && cmake .. \
#    && make \
#    && make install \
#    && ldconfig



RUN apt-get clean
RUN apt-get autoclean
RUN apt-get autoremove -y

RUN echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="601f", MODE:="0666", OWNER="docker"' >> /etc/udev/rules.d/limesdr-mini.rules

######## user settings ######
RUN apt-get install sudo
RUN useradd -u 1000 docker
RUN echo "docker:docker" | chpasswd
RUN echo "root:root" | chpasswd
RUN echo 'root:Docker!' | chpasswd
RUN echo "docker ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER docker

#RUN sudo udevadm control --reload-rules || echo "done" 
#RUN udevadm trigger

# All users can use /home/user as their home directory
ENV HOME=/home/docker

WORKDIR /home/docker


####### handle limesdr-mini rules and permissions
RUN sudo usermod -a -G plugdev docker
RUN sudo usermod -aG root docker

RUN sudo chown -R docker:docker /home/docker
#RUN sudo service udev restart
