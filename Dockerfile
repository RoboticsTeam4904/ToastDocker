FROM ubuntu:15.04
MAINTAINER Erik M <development@yoerik.com>

RUN apt-get install -y software-properties-common git
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y oracle-java8-set-default

RUN apt-get install -y ruby

#openjdk-7-jdk
#ADD server /server

RUN git clone https://github.com/Open-RIO/ToastAPI

WORKDIR /ToastAPI

RUN ./gradlew wpi
RUN ./gradlew build
RUN ./gradlew generateExternalPatches
RUN ./gradlew build
RUN ./gradlew genMetrics
RUN ruby tools/setup.rb
RUN ruby tools/inspector.rb
RUN ruby tools/imports.rb

# Verify install
RUN ./gradlew verify


#EXPOSE 25565
#ENTRYPOINT [ "sh" ]
