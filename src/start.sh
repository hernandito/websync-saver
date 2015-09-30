#!/bin/bash

#cp /Source/cache/appdata/websync/wsdata.json /nobody/websync/dist/wsdata.json

chown -R root:root /nobody
cd /nobody/websync/dist
node server.js
