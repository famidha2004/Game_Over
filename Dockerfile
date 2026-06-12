FROM httpd:2-alpine

COPY /template/. /var/www/html/.

EXPOSE 80

CMD ["httpd", "-g", "daemon off;"]
