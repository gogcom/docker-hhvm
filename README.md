docker-hhvm
==============

Docker image for development with HHVM.

Includes:

- fastcgi on port **9000** (GOG environment variables included)

- preconfigured xdebug (both for browser & console)

###Console commands debug:

Example command for debugging with Docker & PhpStorm. 

`docker run --rm -e XDEBUG_CONFIG="remote_host=192.168.99.1" -e PHP_IDE_CONFIG="serverName=application" gogcom/docker-hhvm hhvm -f script.php`

Notes:

- Replace IP in remote_host with your machine IP seen by Docker (you can check with *ifconfig*).

- **application** is name of configured server containing directory mappings in PhpStorm
