## project description

A [php-spx](https://github.com/NoiseByNorthwest/php-spx) docker alpine based image for testing purposes.

The docker image size is 55 MB.

- Apache 2.4.46 with SSL
- php-fpm 7.4.12
- Xdebug 2.9.8 - debugger and profiler
- [SPX prolifer 0.4.10](https://github.com/NoiseByNorthwest/php-spx)
- composer 2.0.6
- zsh

## build docker image

```bash
docker build -t php-spx-alpine:dev .
```
## start container

```bash
# start container
docker-compose up
CTRL-Z to detach

# stop and delete container
docker-compose down
```
or
```bash
# start container
docker run -p 80:80 -p 443:443 --name php-spx php-spx-alpine:dev
CTRL-Z to detach

# stop and delete container
docker rm -f php-spx
```

## how to use

- Start docker container

- Access the SPX control panel `http://localhost/?SPX_KEY=dev&SPX_UI_URI=/`

- Check checkbox `Whether to enable SPX profiler for your current browser session. No performance impact for other clients.`

- Open script to profile in a new tab `http://localhost/index.php`

- Refresh the SPX control panel tab and the report will be available at the bottom of the screen. Click it to show the report in a new tab.

## get console to container

```bash
docker exec -it php-spx zsh
```
