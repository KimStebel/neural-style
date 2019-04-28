FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y wget git
COPY app /app
WORKDIR /app/models
RUN bash download_models.sh
RUN git clone https://github.com/torch/distro.git /torch --recursive
WORKDIR /torch
RUN apt-get install -y sudo
RUN bash install-deps
RUN bash install.sh
RUN apt-get install -y libprotobuf-dev protobuf-compiler
RUN bash -c "source /torch/install/bin/torch-activate ; luarocks install loadcaffe"
COPY images /images
WORKDIR /app
RUN bash -c "echo -e '\nsource /torch/install/bin/torch-activate' >>/etc/profile"

CMD bash
