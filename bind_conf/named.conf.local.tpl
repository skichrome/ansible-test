
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

zone "{{ dns_suffix_name }}" IN {
        type master;
        file "{{ db_dns_file }}";
};

zone "{{ dns_reverse_ip }}.in-addr.arpa" {
        type master;
        file "{{ db_ip_file }}";
};
