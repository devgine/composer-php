# Composer PHP golden image
[![Build](https://github.com/devgine/composer-php/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/devgine/composer-php/actions/workflows/build.yaml)
[![License](https://img.shields.io/github/license/devgine/composer-php)](https://github.com/devgine/composer-php/blob/main/LICENSE)
![GitHub top language](https://img.shields.io/github/languages/top/devgine/composer-php)

## About
This is a docker image to help you to build and test your PHP projects with different PHP version.<br>
This image contains a necessary tools you need to analyze and test your PHP project.<br>
List of docker images available by PHP versions:

| PHP version | image tag       | docker image                             |
|-------------|-----------------|------------------------------------------|
| PHP 8.3     | _coming soon_   | _coming soon_                            |
| PHP 8.2     | v2-php8.2       | `ghcr.io/devgine/composer-php:v2-php8.2` |
| PHP 8.1     | v2-php8.1       | `ghcr.io/devgine/composer-php:v2-php8.1` |
| PHP 8.0     | v2-php8.0       | `ghcr.io/devgine/composer-php:v2-php8.0` |
| PHP 7.4     | v2-php7.4       | `ghcr.io/devgine/composer-php:v2-php7.4` |
| PHP 7.3     | v2-php7.3       | `ghcr.io/devgine/composer-php:v2-php7.3` |
| PHP 7.2     | v2-php7.2       | `ghcr.io/devgine/composer-php:v2-php7.2` |


## Components
Below is the list of tools with their preinstalled version according to the version of PHP.

| Image tag  -->             | v2-php7.2 | v2-php7.3 | v2-php7.4 | v2-php8.0 | v2-php8.1 | v2-php8.2 |
|----------------------------|-----------|-----------|-----------|-----------|-----------|-----------|
| PHP                        | 7.2       | 7.3       | 7.4       | 8.0       | 8.1       | 8.2       |
| Composer                   | 2.*       | 2.*       | 2.*       | 2.*       | 2.*       | 2.*       |
| PHP Unit                   | 8.5       | 8.5       | 8.5       | 9.5       | 9.5       | 9.5       |
| XDebug                     | 3.1.6     | 3.1.6     | 3.1.6     | 3.1.6     | 3.2.1     | 3.2.1     |
| Rector                     | 0.16      | 0.16      | 0.16      | 0.16      | 0.16      | 0.16      |
| PHPStan                    | 1.10      | 1.10      | 1.10      | 1.10      | 1.10      | 1.10      |
| PHP Coding Standards Fixer | 3.4       | 3.4       | 3.17      | 3.17      | 3.17      | 3.17      |
| PHP Mess Detector          | 2.13      | 2.13      | 2.13      | 2.13      | 2.13      | 2.13      |
| PHP Copy Past Detector     | --        | 6.0       | 6.0       | 6.0       | 6.0       | 6.0       |


## How to
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
        tag: ['v2-php8.2', 'v2-php8.1', 'v2-php8.0', 'v2-php7.4', 'v2-php7.3', 'v2-php7.2']
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
