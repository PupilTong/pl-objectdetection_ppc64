FROM docker.io/ibmcom/powerai:1.6.2-all-ubuntu18.04-py37
ENV LICENSE=yes
LABEL maintainer "haoyangw@bu.edu"
ENV APPROOT="/usr/src/objdect"
WORKDIR $APPROOT
USER root
#RUN export PATH=/usr/include/linux/:$PATH && \
#    export C_INCLUDE_PATH=/usr/include/linux/:$C_INCLUDE_PATH && \
#    export LIBRARY_PATH=/usr/include/linux/:$LIBRARY_PATH &&\
#    export CPATH=$CPATH:/usr/include/linux/


RUN apt update && apt install -y --no-install-recommends python3-dev python3-opencv build-essential libboost-all-dev python-numpy python-setuptools libboost-python-dev libboost-thread-dev nvidia-cuda-dev
#build-essential python3-pip python3-setuptools zlib1g-dev libjpeg-dev libsm6 libxext6 libxrender-dev python3-tk

CMD ["/bin/bash"]
USER pwrai
SHELL ["/opt/anaconda/bin/conda", "run","-n", "wmlce", "/bin/bash", "-c"]
RUN pip install pycuda
COPY ["SSD_Model", "${APPROOT}/SSD_Model"]
COPY ["VOCdevkit", "${APPROOT}/VOCdevkit"]
USER root
RUN apt install -y --no-install-recommends ffmpeg
RUN chown -R pwrai $APPROOT
USER pwrai
#RUN $CONDA_INSTALL_DIR/bin/activate $CONDA_ENV

#RUN export PATH=/usr/include/linux/:$PATH && \
#    export C_INCLUDE_PATH=/usr/include/linux/:$C_INCLUDE_PATH && \
#    export LIBRARY_PATH=/usr/include/linux/:$LIBRARY_PATH &&\
#    export CPATH=$CPATH:/usr/include/linux/
#RUN pip3 install tensorflow-gpu==1.14
#make git pkg-config wget libssl-dev libevent-pthreads* libprotobuf-dev
#libboost-tools-dev libboost-thread1.62-dev magics++
#build & install CMake
