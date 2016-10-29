# pull node base image.
FROM node:6.9

MAINTAINER Nicolas Toublanc <n.toublanc@gmail.com>

# install common tools
ENV APT_PACKAGES wget vim sudo

# install via APT (do not clean sources as we want to be able to install more packages from the development container)
RUN apt-get update && \
    apt-get install -q -y -o Acquire::Retries=10 $APT_PACKAGES

# allow user to go sudo without password
RUN adduser --disabled-password --gecos '' dev
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# sexy bash prompt: https://github.com/twolfson/sexy-bash-prompt
RUN (cd /tmp && git clone --quiet --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt && cd sexy-bash-prompt && make --quiet install && rm -rf /tmp/sexy-bash-prompt/ && cp ~/.bash_prompt /etc/bash.sexy-bash-prompt && echo '. /etc/bash.sexy-bash-prompt' >> /etc/bash.bashrc && echo '. /etc/bash.sexy-bash-prompt' >> /home/dev/.bashrc)

# ls colors: https://github.com/trapd00r/LS_COLORS
RUN wget --quiet https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O /etc/bash.dircolors && echo 'eval $(dircolors -b /etc/bash.dircolors)' >> /etc/bash.bashrc && echo 'eval $(dircolors -b /etc/bash.dircolors)' >> /home/dev/.bashrc

# install common build tools globally via npm
ENV GLOBAL_NPM_PACKAGES bower gulpjs/gulp-cli grunt-cli yo generator-generator generator-fountain-webapp generator-angular-fullstack generator-node forever angular-cli ava strongloop swagger sails

RUN npm install -g $GLOBAL_NPM_PACKAGES

# upgrade inquired to fix this bug while running yeoman: https://github.com/SBoudrias/Inquirer.js/pull/297
RUN npm install inquirer --upgrade

# set default docker user
USER dev

# set default working directory
WORKDIR /app

# force color to be displayed by node: https://github.com/chalk/chalk/issues/79
ENV FORCE_COLOR=1

LABEL org.label-schema.name="Docker node dev tools" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/toubiweb/docker-node-dev-tools" \
      org.label-schema.license="Apache-2.0"
