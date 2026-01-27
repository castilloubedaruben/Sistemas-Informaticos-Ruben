## 📘 Tema 1: Introducción a la terminal y comandos básicos en Linux
🔹 El prompt (indicador de la terminal)

El prompt es lo que ves en la terminal esperando tu orden.

Ejemplo típico:

usuario@maquina:/directorio/actual$


$ → usuario normal

# → superusuario (root, con más permisos, cuidado aquí).


### Comandos: qué son y cómo funcionan

Pueden ser:

Internos (propios del shell, ej: cd, pwd).

Externos (programas instalados, ej: ls, cp).

Estructura general de un comando:
comando [opciones] [argumentos]


Comando → la orden (ls).

Opciones → modifican cómo funciona (-l, -a).

Argumentos → sobre qué actúa (/home/usuario).

✅ Ejemplo:

ls -l /home/usuario

🔹 Navegación por el sistema de archivos

Linux organiza todo en forma de árbol:

/ → raíz (el inicio de todo).

/home → carpetas de usuarios.

/etc → configuraciones.

/var → registros (logs) y datos variables.

Rutas:

Absoluta: empieza desde /.
```bash 
Ej: /home/usuario/documentos
```

Relativa: depende de dónde estés.
```bash
Ej: ../documentos
```

Directorios especiales:
```bash
. → directorio actual.

.. → directorio padre.
```

👉 Consejo: Antes de hacer algo, escribe pwd para confirmar dónde estás.

#### 🔹 Metacaracteres (comodines)

* → (*.txt): listará todos los archivos que terminen con la extensión .txt

? → un solo carácter. (archivo?.log)

[ ] → un rango (archivo[1-3].txt) : enseñara "archivo1.txt", "archivo2.txt", y "archivo3.txt", pero no "archivo4.txt".

{ } → lista (archivo{1,2}.txt)

#### ⚠️ Mucho cuidado con rm * → borra todo en la carpeta actual.

🔹 Comandos básicos de navegación
```bash
pwd → muestra en qué carpeta estás.

cd → moverte entre carpetas:
 ../ (sube un nivel desde donde estas) 
 ../../ (sube dos niveles)
 ./ (indicar el directorio actual)

ls → ver archivos/carpetas: 
ls -l (muestra mas informacion)
ls -a (muestra archivos ocultos)
ls -R (muestra de forma recursiva todo)


tree → ver estructura en forma de árbol.
```

👉 Consejo: Usa ls -lh para ver tamaños de archivos de forma legible (MB/GB).

#### 🔹 Manipulación de archivos y carpetas
```bash
cp → copiar archivos/carpetas:

cp -r (copia todo lo que hay dentro de la carpeta de forma recursiva)
ejem: cp -r "nombre de una carpeta X" /AlumnoM/Docuemntos/Apuntes 

mv → mover o renombrar:

mv archivo.txt /AlumnoM/Documentos/Apuntes
mv archivo.txt archivo2.txt (cambia el nombre del archivo)
mv /AlumnoM/Documentos/Apuntes/Programacion /AlumnoM/Docuemntos/Apuntes/SistemasInformaticos

rm → eliminar:

rm -r Apuntes/ (borra todo dentro de apuntes)


mkdir → crear carpetas:
mkdir -p /AlumnoM/Documentos/Apuntes (crearia estas carpetas si no existieran una dentro de otra)

rmdir → borrar carpetas vacías.

touch → crear archivos vacíos.
```

👉 Consejo: si tienes miedo de borrar algo sin querer, añade la opción -i (ej: rm -i archivo.txt) para que te pregunte.

#### 🔹 Visualización y edición de archivos

```bash
cat → muestra el contenido de un archivo:
cat archivo1.txt archivo2.txt > nuevo_archivo.txt (muestra el contenido de los archivos 1 y 2 en un nuevo archivo en vez de la terminal)

head → ver primeras líneas:
head -n 50 arhivo.txt (muestras las 50 primeras lineas)

tail → ver últimas líneas:
tail -n 50 archivo.txt (muestras las 50 ultimas lineas)
(tail -f para seguir un log en tiempo real).

nano → editor de texto sencillo dentro de la terminal.

```


#### 🔹 Búsqueda de archivos y contenido

#### Find:

```bash
find → busca archivos por nombre, tamaño, fecha, etc:
Ej: find /home(ruta donde buscar) -name(opciones comando) "*.txt"(expresion que quieres buscar)

-Opciones comunes:

-name: Busca archivos por nombre.
find /ruta -name "*.txt" (busca que acabe en .txt, si pones *txt*, que tenga en su nombre eso)

-iname: Busca archivos por nombre (sin tener en cuenta mayúsculas y minúsculas).

-type: Especifica el tipo de archivo o directorio que se busca (f para archivos, d para directorios).
find /ruta -type d
find /ruta -type f

-mtime: Busca archivos por la fechmv ./documentacion ./carpetasa de modificación (en días).
find /ruta -mtime -7 (- para archivos que hayan sido modificados, + que no hayan sido modificados en x tiempo)

-mmin: Busca archivos por la fecha de modificación (en minutos).

-size: Busca archivos en función de su tamaño
find /ruta -size +15k 
```

#### Grep
```bash
grep → busca texto dentro de archivos.
Ej: grep "texto_a_buscar" archivo.txt


    -i: Realiza la búsqueda ignorando mayúsculas y minúsculas.

    -r: Busca de manera recursiva en todos los archivos de un directorio.
grep -r "error" /var/log

    -l: Muestra solo los nombres de los archivos que contienen el patrón.

    -n: Muestra el número de línea donde se encontró el patrón.

    -v: Muestra las líneas que no coinciden con el patrón.

```

👉 Consejo: grep -r "palabra" . busca en todos los archivos de la carpeta actual.


📊 Tabla de comandos más usados
Comando     Qué hace	                        Ejemplo
pwd	    Muestra dónde estás.	            pwd → /home/usuario
cd	    Cambia de carpeta.                  cd documentos/
ls	    Lista archivos/carpetas.	        ls -l (detallado), ls -a (incluye ocultos)
tree	Muestra estructura de árbol.	    tree ~/
cp	    Copiar archivos o carpetas.	        cp archivo.txt /destino/
mv	    Mover o renogrep -r "error" /var/logmbrar.	                mv archivo.txt nuevo.txt
rm	    Eliminar archivos.	                rm archivo.txt, rm -r carpeta/
mkdir	Crear carpeta.	                    mkdir nueva_carpeta
rmdir	Eliminar carpeta vacía.	            rmdir vacia/
touch	Crear archivo vacío.	            touch notas.txt
cat	    Mostrar contenido.	                cat archivo.txt
head	Ver primeras líneas.	            head -n 20 archivo.txt
tail	Ver últimas líneas.	                tail -f log.txt (en tiempo real)
nano	Editar archivos.	                nano archivo.txt
find	Buscar archivos.	                find /home -name "*.jpg"
grep	Buscar texto en archivos.	        grep "error" archivo.log

### TIPS

```bash
*txt* "que contenga lo que hay dentro de los *"

txt* "empiece por lo de delante del * y acabe como sea"

*txt "acabe por lo de detras del * y empiece como sea"

?a?? "busca palabras de 4 digitos que la segunda lentra sea una a" 

```

ocultar archivo: 

Si tienes un archivo llamado ejemplo.txt, debes renombrarlo a .ejemplo.txt usando el comando mv 