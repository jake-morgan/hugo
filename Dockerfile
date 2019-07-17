FROM debian:stretch

# Update and upgrade packages
RUN apt-get -q update -y && apt-get -q upgrade -y
# Install neccessary packages
RUN apt-get -q install -y git hugo python-pygments
