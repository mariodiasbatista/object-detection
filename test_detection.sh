#!/bin/bash

#for this test we need to load some pre-trained weights the objective is to test if darknet is correctly compiled.
cd darknet
ls -la
wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights

output=$(./darknet detect cfg/yolov4.cfg yolov4.weights data/person.jpg) 

if [[ "$output" == *"dog"* && "$output" == *"person"* &&  "$output" == *"horse"* ]]; then
    echo "Detection is working!"
else
    echo "Not Detecting!"
fi

filepath=$(find . -name predictions.jpg | head -n 1)

if [[ -n "$filepath" ]]; then
    echo "Predictions generated at: $filepath"
else
    echo "Prediction file not found."
fi
