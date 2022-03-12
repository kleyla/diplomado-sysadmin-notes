# Seguridad y Hardening en GNU/Linux

## Introduccion y Criptografia

## PKI Infraestructura de llave publica

Conjunto de sw hw personas roles politicas y procedimientos. Relaciona la identidad de una entidad con su llave publica

_Elementos_

- Entidad final
- Autoridad de certificacion / Repositorio
- Autoridad de registro
- Autoridad de validacion
- Lista de revocacion

### Hash y firma digital

EL **hash** es un algoritmo matematico, (NO es criptografia) nos da integridad. Un documento con hash.. si este es modificado el hash nunca sera el mismo.. asi q ya esta comprometido.

Ejemplo: SHA1 SHA2 SHA5 MD2 MD5

La **firma digital** nos da integridad y No repudio (Yo no puedo negar que yo he enviado ese mensaje). Ademas de tener hash este debera ser cifrado/encriptado con la llave privada y la otra parte lo desencripta con la llave publica

**Como funciona PKI**

[Practica de PKI con SSL](./practices/firma-digital/certificate-authority.md)

La firma digital lo que hace es encriptar el hash de tu documento con tu llave privada, el pdf se puede firmar pero no todos
