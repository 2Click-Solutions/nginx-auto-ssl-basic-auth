# Introduction
This is a custom image from image valian/docker-nginx-auto-ssl for auto generation of SSL certs with basic authentication.

# Getting started

Some envionments need to config:
- ALLOWED_DOMAINS:                  Regex pattern of allowed domains.
- SITES:                             Shortcut for defining multiple proxies, in form of domain1=endpoint1; domain2=endpoint2
- BASIC_USERNAME:                    Basic authentication username (default: admin)
- BASIC_PASSWORD:                    Basic authentication password (default: p4ssword)
## Run by docker-compose

docker pull 2clicksolutions/nginx-auto-ssl-basic-auth:0.1\
[docker-compose] example:
```
version: '3.7'
services:
  your-app:
    networks:
        - your-network
  nginx:
    image: 2clicksolutions/nginx-auto-ssl-basic-auth:0.1
    restart: always
    ports:
      - 80:80
      - 443:443
    depends_on:
        - your-app
    volumes:
      - "./ssl-data:/etc/resty-auto-ssl"
    container_name: nginx_basic_auth
    environment:
      ALLOWED_DOMAINS: 'your-domain.com'
      SITES: 'your-domain.com=your_app:your_port'
      BASIC_USERNAME: admin
      BASIC_PASSWORD: p4ssword
    networks:
        - your-network
networks:
  your-network:

```
# Reference:
- https://github.com/Valian/docker-nginx-auto-ssl

[docker-compose]: <https://docs.docker.com/compose/>