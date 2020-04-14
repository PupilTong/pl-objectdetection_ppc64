FROM nvidia/cuda-ppc64le:10.1-devel
LABEL maintainer "haoyangw@bu.edu"
ENV APPROOT="/usr/src/matmultiply"
WORKDIR $APPROOT
UN apt update && apt install -y --no-install-recommends python3 python3-pip make git pkg-config wget libssl-dev
#build & install CMake
RUN mkdir /CmakeBuild && cd /CmakeBuild && \
    git clone -b release https://github.com/Kitware/CMake.git &&\
    cd CMake &&\
    ./bootstrap && make -j$(nproc) && make install
    
RUN mkdir /workspace
# Download TensorRT OSS
RUN cd /workspace &&\
  git clone -b release/5.1 https://github.com/nvidia/TensorRT TensorRT-OSS &&\
  cd TensorRT-OSS &&\
  git submodule update --init --recursive

# Build TensorRT OSS Components
RUN cd /workspace/TensorRT-OSS &&\
 mkdir -p build &&\
 cd build &&\
 cmake .. -DTRT_LIB_DIR=/usr/lib/x86_64-linux-gnu -DTRT_BIN_DIR=`pwd`/out &&\
 make -j$(nproc)

# Copy over files
RUN cd /workspace/TensorRT-OSS/build/out &&\
  cp *.so* /usr/lib/x86_64-linux-gnu/
