FROM phusion/baseimage:0.9.16
MAINTAINER hernando


# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TERM xterm

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh


# set ports
EXPOSE 3000

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Add required files that are local
ADD src/ /root/
#RUN chmod +x /root/install.sh

# Set the locale
RUN locale-gen en_US.UTF-8

# fix up start file
RUN mkdir -p /etc/service/websync

RUN mv /root/start.sh /etc/service/websync/run
RUN chmod +x /etc/service/websync/run

# update apt and get node build deps
RUN apt-get update
RUN apt-get install git nodejs npm mc wget sshpass -y 
RUN cp /usr/bin/nodejs /usr/bin/node 
RUN npm install -g bower
RUN npm install -g gulp

# set user nobody and home to /nobody
ENV HOME /nobody
USER nobody

# fetch websync files


#RUN sh /root/install.sh
RUN cd /nobody 
RUN git clone https://github.com/furier/websync 
RUN cd /nobody/websync
#RUN git checkout 6988c949a20f10d96cb54b8cd9fe4636a654153e  
RUN npm install 
RUN bower install
RUN gulp dist

# reset user to root for runtime
USER root

 # The www directory and proxy config location
VOLUME ["/Backups", "/Source", "/nobody/websync/dist"]



