upstream ktor-rem {
    server {{ nas_url }}:8091;
}

server {
    server_name realestatemanager.ktor.campeoltoni.fr www.realestatemanager.ktor.campeoltoni.fr;

    location / {
        include proxy_params;
        proxy_pass http://ktor-rem;
    }

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/realestatemanager.ktor.campeoltoni.fr/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/realestatemanager.ktor.campeoltoni.fr/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = realestatemanager.ktor.campeoltoni.fr) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    listen [::]:80;

    server_name realestatemanager.ktor.campeoltoni.fr www.realestatemanager.ktor.campeoltoni.fr;
    return 404; # managed by Certbot


}
