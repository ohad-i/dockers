FROM ubuntu:20.04


FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install git swig cmake doxygen \
    python3-numpy python3-numpydoc python3-numpy-dbg python3-scipy \
    python3-docutils python3-qtpy \
    python3-dev python3-wxgtk4.0 python3-mako \
    python3-lxml python3-tk python3-requests python3-sphinx python3-zmq \
    python3-six python3-setuptools python3-bitarray 


RUN apt-get update && apt-get -y install git swig cmake doxygen \
    build-essential libboost-all-dev libtool libusb-1.0-0 libusb-1.0-0-dev \
    libudev-dev libncurses5-dev libfftw3-bin libfftw3-dev libfftw3-doc \
    libcppunit-1.14-0 libcppunit-dev libcppunit-doc ncurses-bin cpufrequtils \
    python-numpy python-numpy-doc python-numpy-dbg python-scipy \
    python-docutils qt4-bin-dbg qt4-default qt4-doc libqt4-dev libqt4-dev-bin \
    python-qt4 python-qt4-dbg python-qt4-dev python-qt4-doc libqwt6abi1 \
    libncurses5 libncurses5-dbg libfontconfig1-dev libxrender-dev libpulse-dev \
    g++ automake autoconf python-dev libusb-dev fort77 libsdl1.2-dev \
    python-wxgtk3.0 ccache python-opengl libgsl-dev python-cheetah python-mako \
    python-lxml qt4-dev-tools libqwtplot3d-qt5-dev pyqt4-dev-tools \
    python-qwt5-qt4 wget libxi-dev gtk2-engines-pixbuf r-base-dev python-tk \
    liborc-0.4-0 liborc-0.4-dev libasound2-dev python-gtk2 libzmq3-dev libzmq5 \
    python-requests python-sphinx libcomedi-dev python-zmq libqwt-dev \
    python-six libgps-dev libgps23 gpsd gpsd-clients python-gps \
    python-setuptools curl python-bitarray libcanberra-gtk-module autotools-dev


ENV WORK_DIR=/home/docker INSTALL_DIR=/opt
WORKDIR ${WORK_DIR}

#ENV UHD_TAG=v3.14.0.0
#RUN git clone https://github.com/EttusResearch/uhd \
#    && cd uhd \
#    && git checkout $UHD_TAG \
#    && cd host \
#    && mkdir build \
#    && cd build \
#    && cmake ../ \
#    && make -j8 \
#    && make test \
#    && make install \
#    && ldconfig \
#    && echo 'LD_LIBRARY_PATH=/usr/local/lib' >> /etc/environment

#RUN uhd_images_downloader --verbose
#RUN cd $WORK_DIR/uhd/host/utils \
#    && cp uhd-usrp.rules /etc/udev/rules.d/ \
#    && groupadd usrp \
#    && usermod -aG usrp root \
#    && echo '@usrp - rtprio 99' >> /etc/security/limits.conf


ENV GNU_TAG=v3.7.13.4
RUN git clone --recursive https://github.com/gnuradio/gnuradio \
    && cd gnuradio \
    && git checkout $GNU_TAG \
    && git submodule update --init --recursive \
    && mkdir build \
    && cd build \
    && cmake ../ \
    && make -j8 \
    && make install \
    && ldconfig 
    #\
    #&& echo 'PYTHONPATH=/usr/local/lib/python3/dist-packages' >> /etc/environment


######## limesdr install ###########
#packages for soapysdr available at myriadrf PPA
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:myriadrf/drivers
RUN apt-get update

#install core library and build dependencies
RUN apt-get -y install git g++ cmake libsqlite3-dev

#install hardware support dependencies
RUN apt-get -y install libsoapysdr-dev libi2c-dev libusb-1.0-0-dev

#install graphics dependencies
RUN apt-get -y install libwxgtk3.0-dev freeglut3-dev

RUN git clone https://github.com/myriadrf/LimeSuite.git \
    && cd LimeSuite \
    && git checkout stable \
    && mkdir builddir && cd builddir \
    && cmake ../ \
    && make -j4 \
    && make install \
    && ldconfig 



#RUN apt-get -y install gr-limesdr
RUN git clone https://github.com/myriadrf/gr-limesdr.git \
	&& cd gr-limesdr \
	&& mkdir build \
	&& cd build \
	&& cmake .. \
	&& make \
	&& make install \
	&& ldconfig

RUN echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="601f", MODE:="0666", OWNER="docker"' >> /etc/udev/rules.d/limesdr-mini.rules



######## some base installs ########
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





RUN apt-get clean
RUN apt-get autoclean
RUN apt-get autoremove -y

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

RUN sudo usermod -a -G plugdev docker
RUN sudo usermod -aG root docker
#RUN sudo usermod -aG usrp docker

RUN sudo chown -R docker:docker /home/docker
RUN sudo service udev restart
