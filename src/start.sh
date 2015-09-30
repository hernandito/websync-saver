#!/bin/bash

#cp /Source/cache/appdata/websync/wsdata.json /nobody/websync/dist/wsdata.json
#if [ ! -f /nobody/websync/dist/wsdata.json ]; then
#    echo "File not found!"
#	cd /nobody 
#	git clone https://github.com/furier/websync 
#	cd websync
#	#RUN git checkout 6988c949a20f10d96cb54b8cd9fe4636a654153e  
#	npm install 
#	bower install
#	gulp dist	
		
#fi



chown -R root:root /nobody
cd /nobody/websync/dist
node server.js
