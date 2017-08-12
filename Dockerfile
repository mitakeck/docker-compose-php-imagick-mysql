FROM centos
MAINTAINER mitake_ck <mitake.ck@gmail.com>

# common utils
RUN yum update && yum install -y wget grep git ssh bash

# install php7
RUN yum install -y epel-release && \
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum -y install --enablerepo=remi-php71 php php-fpm php-mcrypt php-cli php-common php-devel php-gd php-mbstring php-mysqlnd php-opcache php-pdo php-pear php-pecl-apcu php-pecl-zip php-process php-xml php-intl && \
    yum clean all

# install httpd
RUN yum install -y httpd
ADD ./index.php /var/www/html/

# install imagick
RUN yum --enablerepo=remi install -y ImageMagick7 ImageMagick7-devel 
RUN yum install -y gcc gcc-cpp gcc-c++ cpp make re2c icu libicu-devel
RUN pecl channel-update pecl.php.net
RUN pecl install imagick
RUN echo "extension=imagick.so" >> /etc/php.ini

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
