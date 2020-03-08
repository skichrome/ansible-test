upstream minio {
    server {{ nas_url }}:8090;
}

server {
    server_name minio.campeoltoni.fr www.minio.campeoltoni.fr;
    listen 80;
    listen [::]:80;

    location / {
        include proxy_params;
        proxy_pass http://minio;
    }
}
