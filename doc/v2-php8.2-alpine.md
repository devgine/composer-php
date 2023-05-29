# v2-php8.2-alpine
[Homepage](../README.md)

## Tag
`ghcr.io/devgine/composer-php:v2-php8.2-alpine`

## Usage

### Install from the command line
```shell
docker run -ti -v LOCAL_PROJETC_DIR:/var/www/composer ghcr.io/devgine/composer-php:v2-php8.2-alpine sh
```
[All versions](https://github.com/devgine/composer-php/pkgs/container/composer-php/versions)

### Use as base image in Dockerfile
```dockerfile
FROM ghcr.io/devgine/composer-php:v2-php8.2-alpine

# Add your custom instructions here
# example: install symfony cli
RUN apk add --no-cache bash git
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli
```

## Content

| Component                  | version |
|----------------------------|---------|
| Alpine                     | 3.18    |
| PHP                        | 8.2     |
| Composer                   | 2.*     |
| PHP Unit                   | 9.5     |
| XDebug                     | 3.2.1   |
| Rector                     | 0.16    |
| PHPStan                    | 1.10    |
| PHP Coding Standards Fixer | 3.17    |
| PHP Mess Detector          | 2.13    |
| PHP Copy Past Detector     | 6.0     |
