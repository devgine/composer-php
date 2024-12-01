ARG PHP_VERSION=8
ARG COMPOSER_VERSION=2

FROM composer:${COMPOSER_VERSION} AS composer

FROM php:${PHP_VERSION}-fpm-alpine

ARG PHP_VERSION
ARG COMPOSER_VERSION
ARG PHP_CS_FIXER_IGNORE_ENV

ENV PHP_VERSION=$PHP_VERSION
ENV COMPOSER_VERSION=$COMPOSER_VERSION
ENV PHP_CS_FIXER_IGNORE_ENV=$PHP_CS_FIXER_IGNORE_ENV

## XDEBUG
RUN curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions xdebug
COPY .docker/xdebug.ini $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini
## END XDEBUG

## COMPOSER
ENV COMPOSER_HOME=/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH=/composer/vendor/bin:$PATH

COPY --from=composer /usr/bin/composer /usr/bin/composer
## END COMPOSER

## INSTALL PHP DETECTORS (PHPCPD & PHPMD)
RUN wget -c https://phar.phpunit.de/phpcpd.phar -O /usr/local/bin/phpcpd \
    && wget -c https://phpmd.org/static/latest/phpmd.phar -O /usr/local/bin/phpmd \
    && chmod +x /usr/local/bin/phpcpd /usr/local/bin/phpmd

RUN composer global require --prefer-dist \
    phpstan/phpstan \
    symfony/phpunit-bridge \
    friendsofphp/php-cs-fixer \
    rector/rector \
    vimeo/psalm \
    squizlabs/php_codesniffer=* \
	&& composer clear-cache

WORKDIR /var/www/composer

EXPOSE 9000

CMD ["php-fpm", "-F"]

## ClEAN
RUN rm -rf /tmp/* /var/cache/apk/* /var/tmp/*

## LABELS
ARG VCS_REF
ARG BUILD_VERSION
ARG BUILD_DATE
ARG IMAGE_TAG=ghcr.io/devgine/composer-php:latest

LABEL maintainer="yosribahri@gmail.com"
LABEL org.opencontainers.image.title="Composer $COMPOSER_VERSION PHP-fpm $PHP_VERSION docker image"
LABEL org.opencontainers.image.description="This is a docker image based on official alpine image, PHP-fpm \
$PHP_VERSION and composer $COMPOSER_VERSION. This image will help you to build and test your PHP projects with \
different PHP version. It contains a necessary tools you need to analyze and test your PHP project \
(xdebug, phpunit, rector, phpstan, psalm, phpcs, php-cs-fixer, phpmd and phpcpd)."
LABEL org.opencontainers.image.source="https://github.com/devgine/composer-php"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.url="https://github.com/devgine/composer-php"
LABEL org.opencontainers.image.version=$BUILD_VERSION
LABEL org.opencontainers.image.revision=$VCS_REF
LABEL org.opencontainers.image.vendor="devgine"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="devgine/composer-php"
LABEL org.label-schema.description="This is a docker image based on official alpine image, PHP-fpm \
$PHP_VERSION and composer $COMPOSER_VERSION. This image will help you to build and test your PHP projects with \
different PHP version. It contains a necessary tools you need to analyze and test your PHP project \
(xdebug, phpunit, rector, phpstan, psalm, phpcs, php-cs-fixer, phpmd and phpcpd)."
LABEL org.label-schema.url="https://github.com/devgine/composer-php"
LABEL org.label-schema.vcs-url="https://github.com/devgine/composer-php"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -ti -v PROJECT_DIR:/var/www/composer $IMAGE_TAG sh"
LABEL org.label-schema.vendor="devgine"
