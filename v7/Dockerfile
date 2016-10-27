# pull node base image.
FROM node:7.0

MAINTAINER Nicolas Toublanc <n.toublanc@gmail.com>

# install common tools
ENV APT_PACKAGES wget vim sudo

# install via APT (do not clean sources as we want to be able to install more packages from the development container)
RUN apt-get update && \
    apt-get install -q -y -o Acquire::Retries=10 $APT_PACKAGES

# install common build tools globally via npm
ENV GLOBAL_NPM_PACKAGES bower gulpjs/gulp-cli grunt-cli yo generator-generator generator-fountain-webapp generator-angular-fullstack generator-node forever angular-cli

RUN npm install -g $GLOBAL_NPM_PACKAGES

# upgrade inquired to fix this bug while running yeoman: https://github.com/SBoudrias/Inquirer.js/pull/297
RUN npm install inquirer --upgrade

# allow user to go sudo without password
RUN adduser --disabled-password --gecos '' dev
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# set default docker user
USER dev

# set default working directory
WORKDIR /app

LABEL org.label-schema.name="Docker node dev tools" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/toubiweb/docker-node-dev-tools" \
      org.label-schema.license="Apache-2.0"
