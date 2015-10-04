FROM ubuntu:15.04
MAINTAINER Erik M <development@yoerik.com>

RUN apt-get update


RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y git
RUN apt-get install -y wget




RUN wget http://eclipse.mirror.rafal.ca/technology/epp/downloads/release/mars/1/eclipse-cpp-mars-1-linux-gtk-x86_64.tar.gz 

RUN git clone https://github.com/Open-RIO/ToastAPI

ENTRYPOINT [ "sh", "-c", "echo", "$HOME" ]
