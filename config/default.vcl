vcl 4.0;
import std;
import basicauth;

backend server1 {
  .host = ${PROXY_TARGET};                   # IP or Hostname of backend
  .port = ${PROXY_TARGET_PORT};              # Port Apache or whatever is listening

  .first_byte_timeout     = 600s;   # How long to wait before we receive a first byte from our backend?
  .connect_timeout        = 5s;     # How long to wait for a backend connection?
  .between_bytes_timeout  = 2s;     # How long to wait between bytes received from our backend?
}

sub vcl_recv {
  if (!basicauth.match("/etc/varnish/htpasswd",  req.http.Authorization)) {
        return(synth(401, "Authentication required"));
  }
}

sub vcl_synth {
  if (resp.status == 401) {
        set resp.http.WWW-Authenticate = "Basic";
  }
}