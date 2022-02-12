# PROYECTO

cada uno tomara un VM y reunirse como lo hizo y documentarlo

VM1 Ubuntu 192.168.0.35
VM2 Rocky 192.168.0.29

### DNS

192.168.0.18

```
sudo curl -sSL https://install.pi-hole.net | bash
Ok
Ok
Yes
Google
Ok
Ok
Ok
// nivel de provacidad
```

A todo enter

guardar los datos imp: password

ir a la ip quele pusimos -> Login (nos logueamos con el pass) -> Local DNS -> DNS Redords

Alli podemos agregar los dominios y las ips de todos

Ademas en cada uno de ellos se debe cambiar la DNS por la ip del servier-pihole (192.168.0.18)

Desde el servidor DNS ejecutar:

```
dig usrv00.g01.linux
```

WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!

```
ssh-keygen -R AQUÍ_PONES_LA_IP_DEL_SERVIDOR
```
