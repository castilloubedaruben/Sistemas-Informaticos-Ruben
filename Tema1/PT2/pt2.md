## Resolucion ejercicio:
### EJ 1 PRUEBA

dentro de docs, crea dos carpetas documentacion y documentacion2

```bash

mkdir documentacion; mkdir documentacion2
```

dos archivos, archivo .txt y archivo2.txt

```bash
touch archivo.txt archivo2.txt
```

dos programas, programa1.sh y programa2.sh

```bash
touch programa1.sh programa2.sh
```

crea un scrip dentro de docs que haga lo siguiente:
crear 3 carpetas que se llamen carpetas, programas y archivos

```bash

mkdir carpetas programas archivos

```

quiero que almacenes en "carpetas" los nombre de las carpetas que esten en docs, en programas los nombre de los programas (.sh) y en arvhivos lños nombres de los archivos (.txt)

```bash
find -type d > carpetas
find -type f -name "*.sh" > programas
find -type f -name "*.txt" > archivos

```

### EJ 2 PRUEBA
rellena archivo.txt y archivo2.txt con algo de texto que tu quieras

```bash
echo "hola hola hola hola" > archivo.txt
echo "adios adios adios adios > archivo2.txt
o tambien
nano archivo.txt
nano archivo2.txt
```

escribe un script que almacene dentro de archivo2.txt el cotenido de archivo2.txt y detras el contenido de archivo1.txt


```bash
touch script2.sh
("nano y escribo lo de abajo")
#!/bin/bash
cat archivo.txt archivo2.txt > archivo_nuevo.txt
cat archivo_nuevo.txt > archivo2.txt

("ejecutas luego")

```
### EJ 3 EXTRA:

Repite el ejercicio 1 pero como lo pensamos originalmente. En este caso, carpetas, archivos y programas serán carpetas y hay que almacenar en cada uno lo que corresponde. En carpetas, mover todas las carpetas que haya en la carpeta donde estas haciendo el ejercicio, en archivos los archivos y en programas los programas.

NOTA: carpetas no puede estar dentro de la carpeta donde estás trabajando. Qué pasa si intentamos hacerlo con carpetas dentro de nuestra carpeta? Por qué falla?

```bash
mv ./documentacion ./carpetas
mv ./documentacion2 ./carpetas
mv *.txt ./archivos
mv *sh ./programas
```