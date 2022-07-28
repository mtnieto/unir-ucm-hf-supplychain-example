# Blockchain UNIR-UCM
## Unidad 8: Tokenización Retail Logística

La red contiene:

3 Organizaciones con 1 peer por organizaciónç
3 nodos orderer con algoritmo de consenso RAFT
Los peers usan como state database couchdb

En la carpeta network se encuentra la red, para ejecutarla correr el script

````
./fabricOps.sh start

````


En la carpeta app se encuentra el código de la aplicación que recubre la lógica del chaincode.

La ejecución de la app se realiza mediante:

```
node enrollAdmin.js
node interactChaincode.js
```
