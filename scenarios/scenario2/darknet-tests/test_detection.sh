#!/bin/bash

#for this test we need to load some pre-trained weights the objective is to test if darknet is correctly comp>
cd darknet
ls -la
wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights

output=$(./darknet detect cfg/yolov4.cfg yolov4.weights data/person.jpg)

GREEN='\e[32m'
RED='\e[31m'
NC='\e[0m' # Reset color

if [[ "$output" == *"dog"* && "$output" == *"person"* &&  "$output" == *"horse"* ]]; then
    echo -e "\n${GREEN} Detection is working!${NC}"
else
    echo -e "\n${RED} Not Detecting!${NC}"
fi

filepath=$(find . -name predictions.jpg | head -n 1)

if [[ -n "$filepath" ]]; then
    echo -e "${GREEN} Predictions generated at: $filepath \n${NC}"
else
    echo -e "${RED} Prediction file not found. \n${NC}"
fi

#clear predictions file
rm predictions.jpg
