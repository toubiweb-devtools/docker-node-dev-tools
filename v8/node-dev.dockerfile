FROM toubiweb/node-core:8.1

MAINTAINER Nicolas Toublanc <n.toublanc@gmail.com>

# create "dev" user without password
RUN adduser --disabled-password --gecos '' dev
# allow user to go sudo
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# set default docker user
USER dev

# set default working directory
WORKDIR /app
