FROM docker.io/ibmcom/powerai:1.6.2-all-ubuntu18.04-py37
ENV LICENSE=yes
LABEL maintainer "haoyangw@bu.edu"
ENV APPROOT="/usr/src/objdect"
WORKDIR $APPROOT
USER root
COPY ["SSD_Model", "${APPROOT}/SSD_Model"]
COPY ["VOCdevkit", "${APPROOT}/VOCdevkit"]


RUN apt update && apt install -y --no-install-recommends python3-dev python3-opencv build-essential python3-pip python3-setuptools zlib1g-dev libjpeg-dev libsm6 libxext6 libxrender-dev python3-tk
RUN pip3 install pillow
#RUN pip3 install tensorflow-gpu==1.14
#make git pkg-config wget libssl-dev libevent-pthreads* libprotobuf-dev
#libboost-tools-dev libboost-thread1.62-dev magics++
#build & install CMake
