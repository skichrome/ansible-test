upstream res-jenkins {
    server {{ nas_url }}:8080;
}

server {
    server_name resources.jenkins.campeoltoni.fr www.resources.jenkins.campeoltoni.fr;

    location / {
        include proxy_params;
        proxy_pass http://jenkins;
    }

    listen [::]:443; #ssl ipv6only=on; # managed by Certbot
    #    listen resources.jenkins.campeoltoni.fr:443 ssl http2 ipv6only=on;
    ssl on;
    listen 443 ssl; # managed by Certbot

    ssl_certificate /etc/letsencrypt/live/resources.jenkins.campeoltoni.fr/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/resources.jenkins.campeoltoni.fr/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    if ($host = resources.jenkins.campeoltoni.fr) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    listen 80;
    listen [::]:80;

    server_name resources.jenkins.campeoltoni.fr www.resources.jenkins.campeoltoni.fr;

    return 404; # managed by Certbot
}
