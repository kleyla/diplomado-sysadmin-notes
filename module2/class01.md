# ARQUITECTURA DEL SISTEMA

## Determinar y configurar hardware

Dispositivos conectados al bus PCI (aqui esta la tarjeta de video)

```
lspci
lspci -s 0.02 -v // mas info
```

Sirve para ver las conecxiones (entra de datos como usb)

```
lsusb
```

paquete kmod = kernel modules manejador de modulos/componenentes del kernel.

```
lsmod
```

Proveedor de modulos del kernel, para adicionar o remover modules

```
modprobe -r snd-hda-intel
```

### Arvhivos de info y archi de dispositivos

`/proc` archivo q contiene archivos con info sobre los procesos en ejecucion y recursos del hw. Algunos archivos importantes son

```
/proc/cpuinfo // info detallada del cpu
/proc/interrumpts // 
/proc/ioports //
/proc/dma // enumera los canales de acceso directo a memoria
```

Enfocado a almacenamiento

`/dev` device
