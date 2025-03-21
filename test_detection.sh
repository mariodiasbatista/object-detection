  GNU nano 6.2                                  ./test_detection.sh *
#!/bin/bash

#for this test we need to load some pre-trained weights the objective is to test if darknet is correctly comp>
cd darknet
ls -la
wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights

output=$(./darknet detect cfg/yolov4.cfg yolov4.weights data/person.jpg)

if [[ "$output" == *"dog"* && "$output" == *"person"* &&  "$output" == *"horse"* ]]; then
    echo -e "\n ${GREEN} ^|^e Detection is working!"
else
    echo -e "\n ${RED} ^}^l Not Detecting!"
fi

filepath=$(find . -name predictions.jpg | head -n 1)

if [[ -n "$filepath" ]]; then
    echo -e "${GREEN} ^|^e Predictions generated at: $filepath \n"
else
    echo -e "${RED} ^}^l Prediction file not found.\n"
fi
