FROM toubiweb/node-core:6.11

MAINTAINER Nicolas Toublanc <n.toublanc@gmail.com>

# create "prod" user without password
RUN adduser --disabled-password --gecos '' prod

# set default user
USER prod

# set default working directory
WORKDIR /app

# enable NODE production mode
ENV NODE_ENV production
