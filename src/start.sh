#!/bin/bash

<<<<<<< HEAD

=======
sudo nobody

#cp /Source/cache/appdata/websync/wsdata.json /nobody/websync/dist/wsdata.json
>>>>>>> origin/master
#if [ ! -f /nobody/websync/dist/wsdata.json ]; then
#    echo "File not found!"
#	cd /root 
#	git clone https://github.com/furier/websync temp
#	cp -r /root/websync/ /nobody
#	cd /nobody/websync
#	#RUN git checkout 6988c949a20f10d96cb54b8cd9fe4636a654153e  
#	npm install 
#	bower install --allow-root option
#	y
#	gulp dist	
#cp /Source/mnt/cache/appdata/websync/wsdata.json /nobody/websync/dist/wsdata.json		
#fi

sudo root

chown -R root:root /nobody
cd /nobody/websync/dist
node server.js
