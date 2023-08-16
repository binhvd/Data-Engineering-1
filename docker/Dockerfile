# Set the base image to Ubuntu
FROM ubuntu:18.04

# File Author / Maintainer
MAINTAINER Binh Vu

# Install Apache2
RUN  apt-get -y update && apt-get -y install apache2

# Copy your files
COPY index.html /var/www/html/index.html

# Start Apache2
CMD ["apachectl", "-D", "FOREGROUND"]