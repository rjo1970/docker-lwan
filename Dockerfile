FROM ubuntu:latest

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y git cmake zlib1g-dev pkg-config lua5.1-dev \
  libsqlite3-dev libmysqlclient-dev python-pip

RUN git clone git://github.com/lpereira/lwan && \
  cd lwan && \
  mkdir build && \
  cd build && \
  cmake .. -DCMAKE_BUILD_TYPE=Release && \
  make

WORKDIR /lwan
EXPOSE 80 443 8080
VOLUME ["/lwan", "/lwan/wwwroot"]
CMD ["/lwan/build/src/bin/lwan/lwan"]
