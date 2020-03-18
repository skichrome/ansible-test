server {
	server_name portfolio.campeoltoni.fr www.portfolio.campeoltoni.fr;
	root {{ portfolio_root }};

	listen 443 ssl; # managed by Certbot
	ssl_certificate /etc/letsencrypt/live/portfolio.campeoltoni.fr/fullchain.pem; # managed by Certbot
	ssl_certificate_key /etc/letsencrypt/live/portfolio.campeoltoni.fr/privkey.pem; # managed by Certbot
	include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
	ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
	if ($host = portfolio.campeoltoni.fr) {
		return 301 https://$host$request_uri;
	} # managed by Certbot

	listen 80;
	server_name portfolio.campeoltoni.fr www.portfolio.campeoltoni.fr;
	return 404; # managed by Certbot
}
