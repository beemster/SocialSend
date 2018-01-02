FROM ubuntu:16.04

MAINTAINER Beam <b-docker-socialsend@grmbl.net>

RUN apt-get update && apt-get upgrade 
RUN apt-get install -y pkg-config apt-utils build-essential autoconf automake libtool libboost-all-dev libgmp-dev libssl-dev libcurl4-openssl-dev git software-properties-common python-software-properties bsdmainutils
RUN add-apt-repository ppa:bitcoin/bitcoin && apt-get update 
RUN apt-get install -y db4.8-util libdb4.8++-dev libdb4.8++ libdb4.8-dbg libdb4.8-dev libdb4.8-java-dev libdb4.8-java-gcj libdb4.8-java libdb4.8-tcl libdb4.8 

RUN useradd -m send && su - send -c 'git clone https://github.com/SocialSend/SocialSend.git && \
	cd SocialSend && chmod +x share/genbuild.sh && chmod +x autogen.sh  && chmod 755 src/leveldb/build_detect_platform && ./autogen.sh && ./configure && make' && cd ~send/SocialSend && make install

RUN rm -rf /home/send/SocialSend
