#Base image for the container
FROM ubuntu:latest

#Install git and nginx in container
RUN apt-get update -y && \
 apt-get install -y git nginx

#Clone the 2048 game repository and replace the default Nginx HTML directory
RUN  rm -rf /var/www/html && \
  git clone https://github.com/gabrielecirulli/2048.git /var/www/html

# Expose port 80 for incoming HTTP requests
EXPOSE 80

#Disable Nginx's default daemon mode to keep the container running in the foreground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Start Nginx using the specified configuration file
CMD ["/usr/sbin/nginx" ,  "-c" , "/etc/nginx/nginx.conf"]