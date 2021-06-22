FROM ubuntu:20.04
MAINTAINER BiomeHub

LABEL version="1.3.4"
LABEL software.version="1.3.4"
LABEL software="pTrimmer"


# Dependencies
RUN apt-get update && \
    apt-get upgrade -y perl && \
    apt-get install -y gcc make wget unzip gzip && \
    apt install -y zlib1g-dev && \
    DEBIAN_FRONTEND="noninteractive"

#pTrimmer 
RUN wget -pO - https://github.com/DMU-lilab/pTrimmer/archive/refs/heads/master.zip > pTrimmer.zip  &&\
    unzip pTrimmer.zip && \
    rm -rf pTrimmer.zip && \
    cd pTrimmer-master && \
    make && \
    make clean && \
    mv pTrimmer-* /usr/local/bin/pTrimmer