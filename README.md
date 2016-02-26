# varnish-basic-auth-docker
Docker container for Varnish 4.1 with Basic Authentication module compiled in. 

Basic Authentication VMOD git repo [http://git.gnu.org.ua/cgit/vmod-basicauth.git]()

Official Varnish VMOD page [https://www.varnish-cache.org/vmod/basicauth]()

## How-to use docker hub image 


DockerHub: [https://hub.docker.com/r/balmer/varnish-basic-auth/]()


```
docker run -d -e "PROXY_TARGET=example.com" -e "PROXY_TARGET_PORT=8080" -p 80:80 balmer/varnish-basic-auth
```


## Quick How-to for a manual build

```
docker build -t varnish-basic-auth .
docker run -d -e "PROXY_TARGET=IP|DNS-NAME" -e "PROXY_TARGET_PORT=80" -p 80:80 varnish-basic-auth
```

## Notes 


If you don't specify *PROXY\_TARGET\_PORT*, it will point to default port 80.

To change the port Varnish is listening to - modify **ENV VARNISHD\_PARAMS** in Dockerfile or use 
```-e VARNISHD_PARAMS="-a :YOUR_PORT -p default_ttl=3600 -p default_grace=3600"``` when running docker container.

Example:

Docker file

```
ENV VARNISHD_PARAMS -a :YOUR_PORT_HERE
```
Running docker image

```
docker run -d -e "PROXY_TARGET=example.com" -e "PROXY_TARGET_PORT=8080" -e VARNISHD_PARAMS="-a :YOUR_PORT -p default_ttl=3600 -p default_grace=3600" -p HOST_PORT:YOUR_PORT balmer/varnish-basic-auth
```

Default credentials in htpasswd is ```varnish:varnish```