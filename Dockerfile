FROM docker.io/ibmcom/powerai:1.7.0-tensorflow-ubuntu18.04-py36
ENV LICENSE=yes
LABEL maintainer "haoyangw@bu.edu"
ENV APPROOT="/usr/src/objdect"
WORKDIR $APPROOT

COPY ["SSD_Model", "${APPROOT}/SSD_Model"]
RUN cd $APPROOT && wget http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtest_06-Nov-2007.tar && tar -xf VOCtest_06-Nov-2007.tar


RUN apt update && apt install -y --no-install-recommends python3-dev python3-opencv build-essential python3-pip python3-setuptools zlib1g-dev libjpeg-dev libsm6 libxext6 libxrender-dev python3-tk
RUN pip3 install pillow
RUN pip3 install tensorflow-gpu==1.14
#make git pkg-config wget libssl-dev libevent-pthreads* libprotobuf-dev
#libboost-tools-dev libboost-thread1.62-dev magics++
#build & install CMake
