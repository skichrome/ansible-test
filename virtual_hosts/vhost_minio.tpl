upstream minio {
    server {{ nas_url }}:8090;
}

server {
    server_name minio.campeoltoni.fr www.minio.campeoltoni.fr;

    location / {
        include proxy_params;
        proxy_pass http://minio;
    }

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/minio.campeoltoni.fr/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/minio.campeoltoni.fr/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    if ($host = jenkins.campeoltoni.fr) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    listen 80;
    listen [::]:80;

    server_name jenkins.campeoltoni.fr www.jenkins.campeoltoni.fr;

    location / {
        include proxy_params;
        proxy_pass http://jenkins;
    }

    return 404; # managed by Certbot
}
