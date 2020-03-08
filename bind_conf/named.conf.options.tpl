
acl internals { 127.0.0.0/8; 10.7.22.0/24; };

options {
        directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.

        // Port d'échange entre les serveurs DNS
        query-source address * port *;

        forward only;
        forwarders {
                84.200.69.80;
                84.200.70.40;
                208.67.222.222;
                208.67.220.220;
        };

        auth-nxdomain no;    # conform to RFC1035

        // À partir de 9.9.5 ARM, désactiver le scan des interfaces pour éviter l'arrêt inopiné de l'écoute
        interface-interval 0;

        // Ne pas transférer les informations de zones aux DNS secondaires
        allow-transfer { none; };

        // Accepter les requêtes pour le réseau interne uniquement
        allow-query { internals; };

        // Autoriser les requêtes récursives pour les hôtes locaux
        allow-recursion { internals; };

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        dnssec-validation auto;

        listen-on-v6 { any; };
};
