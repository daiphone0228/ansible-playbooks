user nginx;
worker_processes {{ worker_processes }};
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
  worker_connections 1024;
}

http {
  include /etc/nginx/mime.types;
  default_type application/octet-stream;
  log_format main '$remote_addr - $remote_user [$time_local] "$request" '
  '$status $body_bytes_sent "$http_referer" '
  '"$http_user_agent" "$http_x_forwarded_for"';
  access_log /var/log/nginx/access.log main;
  sendfile on;
  tcp_nopush on;
   tcp_nodelay on;
  keepalive_timeout 65;
  gzip on;
  gzip_disable "msie6";
  server_tokens off;
  include /etc/nginx/conf.d/*.conf;
}
