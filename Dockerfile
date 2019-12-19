FROM debian:stretch

# Update and upgrade packages
RUN apt-get -q update -y && apt-get -q upgrade -y
# Install neccessary packages for Hugo
RUN apt-get -q install -y python-pygments git curl

# Docker installation found here - https://docs.docker.com/v17.12/install/linux/docker-ce/debian/#
# Install neccessary packages for Docker
RUN apt-get -q install -y apt-transport-https ca-certificates gnupg2 software-properties-common
# Install Docker GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# Add the stable repository
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
# Install Docker
RUN apt-get -q update -y && apt-get -q install -y docker-ce docker-ce-cli containerd.io

# Configuration variables
ENV HUGO_VERSION 0.61.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
ENV SITE_DIR '/usr/share/blog'

# Download and install hugo
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb
