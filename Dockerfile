FROM centos:latest
MAINTAINER Jonathan Brooker <jonathan.brooker@gmail.com>

COPY . /home/cpp-template

RUN yum update -y \
 && yum group install -y "Development Tools" \
 && yum install -y cmake boost-devel boost-static boost openssl-devel

WORKDIR /home/cpp-template

RUN cd build \
 && rm -rf * \
 && cmake .. \
 && make     \
 && make test
