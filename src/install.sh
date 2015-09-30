#!/bin/sh

cd /nobody 
git clone https://github.com/furier/websync 
cd websync
#RUN git checkout 6988c949a20f10d96cb54b8cd9fe4636a654153e  
npm install 
bower install
gulp dist
