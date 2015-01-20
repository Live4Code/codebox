FROM ubuntu:14.04

#install nodejs
RUN apt-get update
RUN apt-get -y install git python-software-properties python g++ make software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

RUN npm install -g codebox

EXPOSE 3005 8000 35729 4000 5000 6000

# set env vars for discovery service
ENV DISCOVER api-server:3005,user-server:8000,livereload-server:35729, codebox-server:4000, custom1:5000, custom2:6000

VOLUME /var/tmp

# assume we have mount code to /var/tmp
CMD codebox run /var/tmp --port 4000
