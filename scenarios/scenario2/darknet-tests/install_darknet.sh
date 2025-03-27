#!/bin/bash

# Set non-interactive mode for APT
export DEBIAN_FRONTEND=noninteractive

#darknet repo
git clone https://github.com/AlexeyAB/darknet

cd darknet
ls -la

#Enable OpneCV | GPU | CUDNN
sed -i 's/OPENCV=0/OPENCV=1/' Makefile &&
sed -i 's/GPU=0/GPU=1/' Makefile &&
sed -i 's/CUDNN=0/CUDNN=1/' Makefile

#Install cuDNN
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb &&
dpkg -i cuda-keyring_1.1-1_all.deb &&
apt-get update &&
apt-get -y install cudnn

#Install for CUDA 11, perform the above configuration but install the CUDA 11 specific package:
apt-get -y install cudnn-cuda-11

#Install OpenCV
apt -y install libopencv-dev pkg-config

# Clean up after installation
sudo apt clean

echo "Darknet Dependencies - Done !!!"

#build darknet libs
make
echo "Darknet Compile - Done !!!"
