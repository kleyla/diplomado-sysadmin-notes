# Pasos para configurar el DNSSEC

- sudo -i => important
- cd /etc/bind/zones/
- `dnssec-keygen -a NSEC3RSASHA1 -b 2048 -n ZONE karengranadero.com` Se crea una Zone Signing Key (ZSK) con el siguiente comando.
- `dnssec-keygen -f KSK -a NSEC3RSASHA1 -b 4096 -n ZONE karengranadero.com` Se crea una Key Signing Key (KSK) con el siguiente comando.
- En `nano /etc/bind/named.conf.options` agregamos las 3 ultimas lineas y modificamos [Ejemplo](./named.conf.options)
- Con la sgte linea agregamos al archivo 'karengranadero.com' las llaves q creamos

```
for key in `ls Kkarengranadero.com*.key`; do echo "\$INCLUDE $key">> db.karengranadero.com ; done
```

- Se firma el dominio (todos los registros) `dnssec-signzone -A -3 $(head -c 1000 /dev/urandom | sha1sum | cut -b 1-16) -N INCREMENT -o karengranadero.com -t db.karengranadero.com` Se cambia el archivo (db) del dominio por el firmado (nuevo archivo)
  - Crea 'db.karengranadero.com.signed' y 'dsset-karengranadero.com.'
- En `nano /etc/bind/named.conf.local` cambiamos el file del primer zone
  - `file "/etc/bind/zones/db.karengranadero.com.signed";`
- Reiniciamos `sudo systemctl restart named`
- `dig DNSKEY karengranadero.com. @192.168.0.61 +multiline` => status NOERROR
- `dig A www.karengranadero.com. @192.168.0.61 +noadditional +dnssec +multiline`
