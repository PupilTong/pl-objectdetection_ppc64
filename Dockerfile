FROM docker.io/ibmcom/powerai:1.7.0-all-ubuntu18.04-py37
ENV LICENSE=yes
LABEL maintainer "haoyangw@bu.edu"
ENV APPROOT="/usr/src/objdect"
WORKDIR $APPROOT
RUN apt update && apt install -y --no-install-recommends python3-opencv python3-pip make git pkg-config wget libssl-dev libevent-pthreads* libprotobuf-dev
#libboost-tools-dev libboost-thread1.62-dev magics++
#build & install CMake

COPY ["SSD_Model", "${APPROOT}"]
COPY ["VOCdevkit", "${APPROOT}"]
