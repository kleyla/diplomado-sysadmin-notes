## Clase 6: Tema 3:

`tar`: empaquetar tar -cvf archivo.tar docs/proyecto
desempaquetar

```
tar -xvf archivo.tar
```

Compresores de ficheros: `gzip`: antes se empaquetaba luego se comprimia.

```
gzip fichero // generalmente es el nivel 6, por defecto lo agarra, comprime y desaparece
gzip -9 fichero // mayor factor de compresion, consume mas ram
```

`tar.gz`:

```
tar -czvf /tar/archivo.tar.gz compreso, genera el empaquetado y el compreso a la misma ves.
```

`zip`:

```
zip archivo.zip ficheros a comprimir
unzip archivo.zip - unzip -v archivo.zip
```

Para archivos grandes con tar.gz

```
tar -cjvf tar/bzip2.compreso.tar.bz2 compreso/*
tar -cjvf tar/xzip-compreso.tar.xz compreso/*
```

la compresion consume recursos.
