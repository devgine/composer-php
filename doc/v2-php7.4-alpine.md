# v2-php7.4-alpine
[Homepage](../README.md)

## Tag
`ghcr.io/devgine/composer-php:v2-php7.4-alpine`

## Usage

### Install from the command line
```shell
docker run -ti -v LOCAL_PROJETC_DIR:/var/www/composer ghcr.io/devgine/composer-php:v2-php7.4-alpine sh
```
[All versions](https://github.com/devgine/composer-php/pkgs/container/composer-php/versions)

### Use as base image in Dockerfile
```dockerfile
FROM ghcr.io/devgine/composer-php:v2-php7.4-alpine

## SYMFONY CLI INSTALL
RUN apk add --no-cache bash git
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli
## END SYMFONY CLI INSTALL
```

## Content

| Component                  | version |
|----------------------------|---------|
| Alpine                     | 3.16    |
| PHP                        | 7.4     |
| Composer                   | 2.*     |
| PHP Unit                   | 9.5     |
| XDebug                     | 3.1.6   |
| Rector                     | 0.16    |
| PHPStan                    | 1.10    |
| PHP Coding Standards Fixer | 3.17    |
| PHP Mess Detector          | 2.13    |
| PHP Copy Past Detector     | 6.0     |
