FROM httpd:2-alpine

COPY template/ /usr/local/apache2/htdocs/

EXPOSE 90

CMD ["httpd", "-g", "daemon off;"]
