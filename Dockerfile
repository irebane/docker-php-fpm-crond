FROM php:5.6-fpm-alpine

ADD crontab.txt /crontab.txt
RUN mkdir /var/www/app
ADD script.php /var/www/app
RUN chown -R www-data:www-data /var/www/app
RUN /usr/bin/crontab /crontab.txt

CMD ["/usr/sbin/crond", "-f"]