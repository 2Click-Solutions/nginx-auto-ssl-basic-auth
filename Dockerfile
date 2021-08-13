FROM valian/docker-nginx-auto-ssl

RUN apk update && apk add --no-cache apache2-utils

# instead of . use directory with your configurations
ENV BASIC_USERNAME=admin
ENV BASIC_PASSWORD=p4ssword


COPY server-proxy.conf /usr/local/openresty/nginx/conf/server-proxy.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod 0755 ./entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]