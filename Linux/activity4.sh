#!/bin/bash
#
#
##create .mp3 files
touch song{1,2,3,4,5}.mp3
touch snap{1,2,3,4,5,6}.jpg
touch film{1,2,3,4,5}.mp4

mkdir -p music
mkdir -p picture
mkdir -p Videos


mv *.mp3 music
mv *.jpg picture
mv *.mp4 Videos
