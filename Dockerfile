FROM debian:jessie
MAINTAINER <frodon1@gmail.com>

RUN echo "deb http://deb.debian.org/debian jessie contrib non-free" >> /etc/apt/sources.list \
 && echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get clean && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y sudo wget rsync build-essential ca-certificates locales openssh-client \
      python-apt git dvipng libfftw3-dev libreadline-dev libhdf5-dev hdf5-tools gfortran automake autoconf libtool \
      python libboost-all-dev swig2.0 libcgal-dev libomniorb4-dev graphviz-dev libgl1-mesa-dev libglu1-mesa-dev libxmu-dev \
      omniidl omniidl-python omniorb-nameserver libcos4-dev python-omniorb liblapack-dev python-numpy python-scipy \
      graphviz doxygen libxml2 libxslt1-dev python-lxml python-setuptools python-pygments python-jinja2 python-docutils \
      python-sphinx libtbb-dev libfreetype6-dev libfreeimage-dev python-sip-dev metis libmetis-dev scotch libscotch-dev \
      libtogl-dev tcl8.5-dev tk8.5-dev tix-dev libcgns-dev libopencv-dev libcppunit-dev python-pkgconfig cython python-h5py \
      tralics libmuparser-dev libcgal-dev python-pil python-gnuplot libnlopt-dev \
      libfontconfig1 libglib2.0-0 libglu1-mesa libxmu6 libxrender1 mesa-utils net-tools \
      dbus-x11 fonts-dejavu fonts-liberation hicolor-icon-theme \
      libcanberra-gtk3-0 libcanberra-gtk-module libcanberra-gtk3-module \
      libglib2.0 libgtk2.0-0 libdbus-glib-1-2 libxt6 libexif12 \
      libgl1-mesa-glx libgl1-mesa-dri nvidia-driver \
 && rm -rf /var/lib/apt/lists/* \
 && update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
 && echo 127.0.1.1 $(hostname) >> /etc/hosts

COPY archives /opt/archives

RUN wget -O /opt/archives/gmsh-2.11.0-source.tar.gz http://gmsh.info/src/gmsh-2.11.0-source.tgz \
 && wget -O /opt/archives/netgen-5.3.1.tar.gz https://sourceforge.net/projects/netgen-mesher/files/netgen-mesher/5.3/netgen-5.3.1.tar.gz \
 && wget -O /opt/archives/cmake-3.6.2.tar.gz https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz \
 && wget -O /opt/archives/matplotlib-1.4.3.tar.gz https://sourceforge.net/projects/matplotlib/files/matplotlib/matplotlib-1.4.3/matplotlib-1.4.3.tar.gz \
 && wget -O /opt/archives/PyQt5_gpl-5.6.tar.gz https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.6/PyQt5_gpl-5.6.tar.gz \
 && wget -O /opt/archives/qt-everywhere-opensource-src-5.6.1-1.tar.gz http://download.qt.io/archive/qt/5.6/5.6.1-1/single/qt-everywhere-opensource-src-5.6.1-1.tar.gz \
 && wget -O /opt/archives/qwt-6.1.2.tar.bz2 https://sourceforge.net/projects/qwt/files/qwt/6.1.2/qwt-6.1.2.tar.bz2 \
 && wget -O /opt/archives/sip-4.18.tar.gz https://sourceforge.net/projects/pyqt/files/sip/sip-4.18/sip-4.18.tar.gz
