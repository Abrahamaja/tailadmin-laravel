FROM php:8.2-cli-alpine

WORKDIR /app

COPY . .

RUN apk add --no-cache bash git curl unzip \
    && curl -sS https://getcomposer.org/installer | php \
    && php composer.phar install --no-dev

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
