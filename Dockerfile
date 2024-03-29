FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive

# base
RUN apt-get -y update && apt-get install -y \
	build-essential \
	git \
	ninja-build \
	curl

# cmake for ubuntu 22.04
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main' | \
	tee /etc/apt/sources.list.d/kitware.list && \
	curl -sSL https://apt.kitware.com/keys/kitware-archive-latest.asc | \
	apt-key --keyring /usr/share/keyrings/kitware-archive-keyring.gpg add - && \
	apt-get update -y && apt-get install -y kitware-archive-keyring cmake

# build
WORKDIR /example

# vcpkg
# docs say this is required true on arm64
ENV VCPKG_FORCE_SYSTEM_BINARIES=true

# for python3 per the port
RUN apt-get -y update && apt-get install -y autoconf automake autoconf-archive

# for the build
RUN apt-get -y update && apt-get install -y zip unzip tar linux-libc-dev pkg-config && \
	git clone https://github.com/Microsoft/vcpkg.git && ./vcpkg/bootstrap-vcpkg.sh

RUN apt-get -y update && apt-get install -y python3 python3-pip python3-venv 

COPY vcpkg.json .

RUN ./vcpkg/vcpkg install --debug

# source
COPY . .

RUN cmake -B build -G Ninja -D CMAKE_BUILD_TYPE=Debug
RUN cmake --build build --parallel $(nproc)
