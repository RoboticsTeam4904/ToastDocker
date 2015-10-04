FROM ubuntu:15.04
MAINTAINER Erik M <development@yoerik.com>

RUN apt-get update
RUN apt-get install -y git openjdk-7-jdk

RUN git clone https://github.com/Open-RIO/ToastAPI

ENTRYPOINT [ "sh", "-c", "echo", "$HOME" ]
