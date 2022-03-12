$TTL    604800
@       IN      SOA     ns1.karengranadero.com. admin.karengranadero.com. (
                              4         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;


; name servers - NS records
    IN      NS      ns1.karengranadero.com.
;    IN      NS      ns2.karengranadero.com.


; name server - A records
ns1.karengranadero.com.        IN      A        192.168.0.61
;ns2.karengranadero.com.        IN      A        192.168.3.4

; 192.168.0.0/24 - A records
server01.karengranadero.com.        IN      A        192.168.0.61
;host2.karengranadero.com.        IN      A        192.168.3.6
www.karengranadero.com.        IN      CNAME    server01.karengranadero.com.
