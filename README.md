# docker-ubuntu
Docker image built on ubuntu:20.04 with Apache, PHP, Composer &amp; more. 

## sample docker-compose.yml
```
version: '3'
services:
  app:
    image: imanilchaudhari/docker-ubuntu:22.04
    restart: 'no'
    ports:
      - 8010:80
    volumes:
      - './:/var/www/html/'
      - './docker/app/app.conf:/etc/apache2/sites-available/000-default.conf'
      - './docker/php/php.ini:/etc/php/8.1/apache2/php.ini'
      - './docker/php/php.ini:/etc/php/8.1/cli/php.ini'
    links:
      - mariadb
      - mailhog
  mariadb:
    image: 'mariadb:10.3.28'
    restart: 'no'
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: 'database'
  adminer:
    image: adminer
    restart: 'no'
    links:
      - mariadb
    ports:
      - 8011:8080
  mailhog:
    image: mailhog/mailhog
    restart: 'no'
    ports:
      - 1025:1025
      - 8025:8025

```
