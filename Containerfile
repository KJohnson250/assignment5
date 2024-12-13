# Use the latest Fedora image as the base
FROM fedora:latest

# Upgrade the system and install the required applications
RUN dnf -y upgrade && \
    dnf -y install tuxpaint vim httpd

# Add the myinfo.html file to the container
COPY myinfo.html /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80/TCP

# Enable the httpd service
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]



