upstream portainer {
    server {{ nas_url }}:9000;
}

server {
    server_name portainer.campeoltoni.fr www.portainer.campeoltoni.fr;

    location / {
        include proxy_params;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "";
        proxy_pass http://portainer;
    }

    location /ws {
        include proxy_params;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://portainer/ws;
    }

    location /api/websocket {
        include proxy_params;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://portainer/api/websocket;
    }

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/portainer.campeoltoni.fr/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/portainer.campeoltoni.fr/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = portainer.campeoltoni.fr) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    listen [::]:80;

    server_name portainer.campeoltoni.fr www.portainer.campeoltoni.fr;
    return 404; # managed by Certbot


}
