# Composer PHP golden image
[![Build](https://github.com/devgine/composer-php/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/devgine/composer-php/actions/workflows/build.yaml)
[![License](https://img.shields.io/github/license/devgine/composer-php)](https://github.com/devgine/composer-php/blob/main/LICENSE)
![GitHub top language](https://img.shields.io/github/languages/top/devgine/composer-php)

## About
This repository is a docker image based on php-alpine to help you to build and test your PHP projects with different PHP version.<br>
This docker image contains a necessary tools you need to analyze and test your PHP project.<br>
List of docker images available by PHP versions:

| PHP version | Docker image tags                               |
|-------------|-------------------------------------------------|
| PHP 8.3     | _coming soon_                                   |
| PHP 8.2     | `ghcr.io/devgine/composer-php:latest`           |
| PHP 8.2     | `ghcr.io/devgine/composer-php:v2-php8.2-alpine` |
| PHP 8.1     | `ghcr.io/devgine/composer-php:v2-php8.1-alpine` |
| PHP 8.0     | `ghcr.io/devgine/composer-php:v2-php8.0-alpine` |
| PHP 7.4     | `ghcr.io/devgine/composer-php:v2-php7.4-alpine` |
| PHP 7.3     | `ghcr.io/devgine/composer-php:v2-php7.3-alpine` |
| PHP 7.2     | `ghcr.io/devgine/composer-php:v2-php7.2-alpine` |

## Components
All image tags are based on alpine.
Below is the list of tools with their preinstalled version according to the version of PHP.

| Image tag                                   | PHP | Composer | PHP Unit | XDebug | Rector | PHPStan | PHP CS FIXER | PHP MD | PHP CPD |
|---------------------------------------------|-----|----------|----------|--------|--------|---------|--------------|--------|---------|
| [latest](doc/latest.md)                     | 8.2 | 2.*      | 9.5      | 3.2.1  | 0.16   | 1.10    | 3.17         | 2.13   | 6.0     |
| [v2-php8.2-alpine](doc/v2-php8.2-alpine.md) | 8.2 | 2.*      | 9.5      | 3.2.1  | 0.16   | 1.10    | 3.17         | 2.13   | 6.0     |
| [v2-php8.1-alpine](doc/v2-php8.1-alpine.md) | 8.1 | 2.*      | 9.5      | 3.2.1  | 0.16   | 1.10    | 3.17         | 2.13   | 6.0     |
| [v2-php8.0-alpine](doc/v2-php8.0-alpine.md) | 8.0 | 2.*      | 9.5      | 3.2.1  | 0.16   | 1.10    | 3.17         | 2.13   | 6.0     |
| [v2-php7.4-alpine](doc/v2-php7.4-alpine.md) | 7.4 | 2.*      | 8.5      | 3.1.6  | 0.16   | 1.10    | 3.17         | 2.13   | 6.0     |
| [v2-php7.3-alpine](doc/v2-php7.3-alpine.md) | 7.3 | 2.*      | 8.5      | 3.1.6  | 0.16   | 1.10    | 3.4          | 2.13   | 6.0     |
| [v2-php7.2-alpine](doc/v2-php7.2-alpine.md) | 7.2 | 2.*      | 8.5      | 3.1.6  | 0.16   | 1.10    | 3.4          | 2.13   | --      |

## Usage
### Install from the command line
```shell
docker run -ti -v LOCAL_PROJETC_DIR:/var/www/composer ghcr.io/devgine/composer-php:latest sh
```
[All versions](https://github.com/devgine/composer-php/pkgs/container/composer-php/versions)
### Use as base image in Dockerfile
```dockerfile
FROM ghcr.io/devgine/composer-php:latest
```

### Use components
Inside the container, you can run any tool you need from any working directory.<br>
Global vendor binaries are added to the PATH environment.
#### Composer
```shell
composer --help
```
#### PHP Unit
```shell
simple-phpunit --help
```
#### Rector
```shell
rector --help
```
#### PHPStan
```shell
phpstan --help
```
#### PHP Coding Standards Fixer
```shell
php-cs-fixer --help
```
#### PHP Mess Detector
```shell
phpmd --help
```
#### PHP Copy Past Detector
```shell
phpcpd --help
```

## Use image in continuous integration
### GitHub action
```yaml
name: 'Workflow name'
on:
  push
jobs:
  job-id:
    runs-on: ubuntu-latest
    ...
    container:
      image: ghcr.io/devgine/composer-php:latest
    steps:
      - name: 'Run Tests'
        run: simple-phpunit --coverage text
      ...
```

An example with matrix strategy
```yaml
name: 'Matrix strategy'
on:
    push
jobs:
  job-id:
    runs-on: ubuntu-latest
    ...
    strategy:
      fail-fast: false
      matrix:
        tag: ['v2-php8.2-alpine', 'v2-php8.1-alpine', 'v2-php8.0-alpine', 'v2-php7.4-alpine']
    container:
      image: ghcr.io/devgine/composer-php:${{ matrix.tag }}
    steps:
      - name: 'Run Tests'
        run: simple-phpunit --coverage text
      ...
```

### Gitlab CI
_Coming soon_

### Circle CI
_Coming soon_

## References
* [PHP Unit supported versions](https://phpunit.de/supported-versions.html)
* [Xdebug compatibility](https://xdebug.org/docs/compat)
* [PHP Unit](https://symfony.com/doc/current/components/phpunit_bridge.html)
* [Rector](https://packagist.org/packages/rector/rector)
* [PHPStan](https://phpstan.org/)
* [PHP Coding Standards Fixer](https://cs.symfony.com/)
* [PHP Mess Detector](https://phpmd.org/)
* [PHP Copy Past detector](https://github.com/sebastianbergmann/phpcpd)
