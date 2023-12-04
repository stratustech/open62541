FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    apt-utils \
    apt-file \
    build-essential \
    gcc \
    pkg-config \
    cmake \
    python3 \
    libmbedtls-dev \
    libcjson-dev

RUN apt-file update

