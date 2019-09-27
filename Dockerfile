FROM debian:stretch

# Update and upgrade packages
RUN apt-get -q update -y && apt-get -q upgrade -y
# Install neccessary packages
RUN apt-get -q install -y python-pygments git curl

# Configuration variables
ENV HUGO_VERSION 0.58.3
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
ENV SITE_DIR '/usr/share/blog'

# Download and install hugo
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb
