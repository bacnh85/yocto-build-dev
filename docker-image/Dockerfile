FROM debian:latest

# Docker variables
ARG UID=1000
ARG GID=1000

# Update packages
RUN rm /bin/sh && ln -s bash /bin/sh \ 
     # add user package
     &&  apt-get update && apt-get install -y \
     gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     pylint3 xterm \
     ## Extra pkg
     locales tmux screen libncurses5-dev \
     ## For building poky docs
     make xsltproc docbook-utils fop dblatex xmlto \
     ## Install kas
     && pip3 install kas \
     # Clean up
     && rm -rf /var/lib/apt/lists/*

# Setup the environment
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.UTF-8

WORKDIR /opt
VOLUME [ "/opt" ]

COPY entrypoint.sh /
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["sh","/entrypoint.sh"]
