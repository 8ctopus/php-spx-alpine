## project description

A [php-spx](https://github.com/NoiseByNorthwest/php-spx) docker alpine based image for testing purposes.

The docker image size is 361 MB.

- php SPX v0.4.10

## start container

```bash
docker-compose up
```
or
```bash
# start container
docker run -p 80:80 -p 443:443 --name php-spx 8ct8pus/php-spx-alpine
+ CTRL-Z to detach

# stop and delete container
docker rm php-spx
```

## how to use

- Access the SPX control panel `http://localhost/?SPX_KEY=dev&SPX_UI_URI=/`

- Check checkbox `Whether to enable SPX profiler for your current browser session. No performance impact for other clients.`

- Open script to profile in a new tab `http://localhost/index.php`

- Refresh the SPX control panel tab and the report will be available at the bottom of the screen. Click it to show the report in a new tab.

## get console to container

```bash
docker exec -it php-spx zsh
```

## build docker image

```bash
docker build -t php-spx-alpine:dev .
```

