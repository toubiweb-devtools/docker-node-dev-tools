# pull node base image.
FROM node:5.3-wheezy

MAINTAINER Nicolas Toublanc <n.toublanc@gmail.com>

# install common tools
ENV APT_PACKAGES wget vim sudo

# install via APT (do not clean sources as we want to be able to install more packages from the development container)
RUN apt-get update && \
    apt-get install -q -y -o Acquire::Retries=10 $APT_PACKAGES

# install common build tools globally via npm
ENV GLOBAL_NPM_PACKAGES bower gulp grunt-cli

RUN npm install -g $GLOBAL_NPM_PACKAGES

# allow user to go sudo without password
RUN adduser --disabled-password --gecos '' dev
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# set default docker user
USER dev

# set default working directory
WORKDIR /app
