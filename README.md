## project description

A [php-spx 0.4.10](https://github.com/NoiseByNorthwest/php-spx) docker alpine based image for testing purposes.

The docker image size is xx MB.

## start container

```bash
docker run -p 80:80 -p 443:443 --name php-spx 8ct8pus/php-spx-alpine
+ CTRL-Z to detach

docker rm php-spx
```
or
```bash
docker-compose up
```

## how to use

- Open `http://localhost/?SPX_KEY=dev&SPX_UI_URI=/` in the browser to access the SPX control panel.

- Check `Whether to enable SPX profiler for your current browser session. No performance impact for other clients.`

- Open in a new tab `http://localhost/`.

- Refresh the SPX control panel and a report will be available at the bottom of the screen. Click the report to open.

## get console to container

```bash
docker exec -it php-spx zsh
```

## build docker image

```bash
docker build -t php-spx-alpine:dev .
```

