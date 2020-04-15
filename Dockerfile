FROM docker.io/ibmcom/powerai:1.7.0-tensorflow-ubuntu18.04-py37
ENV LICENSE=yes
LABEL maintainer "haoyangw@bu.edu"
ENV APPROOT="/usr/src/objdect"
WORKDIR $APPROOT

COPY ["SSD_Model", "${APPROOT}"]
RUN cd $APPROOT && wget http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtest_06-Nov-2007.tar && tar -xf VOCtest_06-Nov-2007.tar


RUN apt update && apt install -y --no-install-recommends python3-opencv python3-pip make git pkg-config wget libssl-dev libevent-pthreads* libprotobuf-dev
#libboost-tools-dev libboost-thread1.62-dev magics++
#build & install CMake
