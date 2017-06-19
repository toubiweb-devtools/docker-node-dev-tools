FROM node:8.1

MAINTAINER Nicolas Toublanc <n.toublanc@gmail.com>

# install common tools
ENV CORE_PACKAGES bash wget vim git sudo

# install via APT
RUN apt-get update && \
    apt-get install -q -y -o Acquire::Retries=10 $CORE_PACKAGES && \
# immediately remove temporary files
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# sexy bash prompt: https://github.com/twolfson/sexy-bash-prompt
RUN (cd /tmp && git clone --quiet --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt && cd sexy-bash-prompt && make --quiet install && rm -rf /tmp/sexy-bash-prompt/ && cp ~/.bash_prompt /etc/bash.sexy-bash-prompt && echo '. /etc/bash.sexy-bash-prompt' >> /etc/bash.bashrc)

# ls colors: https://github.com/trapd00r/LS_COLORS
RUN wget --quiet https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O /etc/bash.dircolors && echo 'eval $(dircolors -b /etc/bash.dircolors)' >> /etc/bash.bashrc

# force color to be displayed by node: https://github.com/chalk/chalk/issues/79
ENV FORCE_COLOR=1

LABEL org.label-schema.name="Docker node runner" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/toubiweb/docker-node-runner" \
      org.label-schema.license="Apache-2.0"

# set default working directory
WORKDIR /app
