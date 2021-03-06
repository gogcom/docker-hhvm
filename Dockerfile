FROM gogcom/docker-git

MAINTAINER GOG Team <webdev@gog.com>

ENV HHVM_VERSION 3.11.1

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update
RUN apt-get install -y hhvm=${HHVM_VERSION}~jessie

ADD php.ini /etc/hhvm/
ADD server.ini /etc/hhvm/

# Install composer
RUN apt-get install -y curl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Exposing HHVM-FastCGI port
EXPOSE 9000

CMD ["hhvm", "--mode", "server" ,"-vServer.Type=fastcgi", "-vServer.Port=9000"]