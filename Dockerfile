FROM ubuntu:22.04
ENV IS_DOCKER true

# Metadata
LABEL "com.example.vendor"="Bella iOS"
LABEL org.opencontainers.image.authors="bellaiospa@gmail.com"
LABEL version="0.1.0"
LABEL description="Initial Version of Bella iOS AI Personal Assistant."

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
ARG DEBIAN_FRONTEND=noninteractive

# Install base dependencies
RUN apt-get update && apt-get install --yes -q --no-install-recommends \
apt-transport-https build-essential ca-certificates curl git wget openssl \
ssh openssh-server sudo software-properties-common automake make g++ \
ncurses-dev nvi pkg-config unzip wavpack zip \
libtool libssl-dev libz-dev zlib1g-dev libbz2-dev libreadline-dev \
libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
libffi-dev liblzma-dev libgdbm-dev libnss3-dev libc6-dev patchelf

# Run the container as an unprivileged user
RUN groupadd docker && useradd -g docker -s /bin/bash -m docker
USER docker
WORKDIR /home/docker

# Install Python3.9.10
RUN wget https://www.python.org/ftp/python/3.9.10/Python-3.9.10.tgz && tar -xvf Python-3.9.10.tgz
WORKDIR /home/docker/Python-3.9.10
ENV PATH $PWD:$PATH
USER root
RUN /bin/bash -c "./configure --enable-optimizations && sudo make install"
RUN rm -R /home/docker/Python-3.9.10.tgz
RUN pip3 install piping && pip3 install pipenv==2022.7.24

# Install Node.js with nvm
USER docker
ENV NVM_DIR /home/docker/.nvm
ENV NODE_VERSION v18.16.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION"

# cleanup
USER root
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

# Update npm install folder (local/global)
WORKDIR /home/docker/bella
RUN chown -R docker $PWD
ENV PATH $PWD/bin:$PWD/lib:$NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
RUN npm config set prefix $PWD && npm config set prefix $PWD -g

# Install Bella
EXPOSE 1337:1337

USER docker
COPY --chown=docker ./ ./

RUN npm install

# Generate Python Binaries
# RUN npm run setup:python-bridge
# RUN npm run build:python-bridge
# RUN npm run setup:tcp-server
# RUN npm run build:tcp-server

# Build Bella
RUN npm run build
# RUN npm run check

# Start Bella iOS at BOOT
CMD ["npm", "start"]