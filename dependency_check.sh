#!/bin/bash

#check if we have GPU
gpu_info=$(nvidia-smi 2>&1)

if echo "$gpu_info" | grep -q "command not found"; then
  echo "Not connected to a GPU"
else
  echo -e "GPU exists:\n$gpu_info"
fi

#check if we have Python installed
pip_info=$(pip --version 2>&1)

if echo "$pip_info" | grep -q "command not found"; then
  echo "Need to install Python"
else
  echo -e "Python exists:\n$pip_info"
fi