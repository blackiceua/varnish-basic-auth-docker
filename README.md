# varnish-basic-auth-docker
Docker container for Varnish 4.1 with Basic Authentication module compiled in. 

Basic Authentication VMOD git repo http://git.gnu.org.ua/cgit/vmod-basicauth.git

Official Varnish VMOD page https://www.varnish-cache.org/vmod/basicauth

# Quick How-to
```
docker build -t varnish-basic-auth .
docker run -d -e "PROXY_TARGET=IP|DNS-NAME" -e "PROXY_TARGET_PORT=80" -p 80:80 varnish-basic-auth
```
You may not specify **PROXY_TARGET_PORT**. In this case it will point to port 80.

To change the port Varnish is listening to - modify *ENV VARNISHD_PARAMS* in Dockerfile. 

Example:

```
ENV VARNISHD_PARAMS -a :YOUR_PORT_HERE
```

Default credentials in htpasswd is ```varnish:varnish```