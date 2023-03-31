#!/bin/bash
# scantofile
#
sleep 0.2


OUTPUT=/root/scanTarget/scan_"$(date +%Y-%m-%d-%H-%M-%S)"_%03d.pdf
DEVICE=escl:http://10.0.0.61:80
RESOLUTION=600
MODE=Color

SCANIMAGE="scanimage --format=pdf --device=$DEVICE --resolution $RESOLUTION --batch=$OUTPUT --mode=$MODE"

SCANIMAGE_RESULT=$($SCANIMAGE --source=ADF 2>&1)

if [[ $SCANIMAGE_RESULT =~ "out of documents" ]]; then
  SCANIMAGE_RESULT=$($SCANIMAGE --source=FB 2>&1)
fi
