#Dockerfile for edu proj
FROM devopsedu/webapp
USER ubuntu
ADD website /var/www/html
RUN rm /var/www/html/index.html
CMD apachectl -D FOREGROUND
