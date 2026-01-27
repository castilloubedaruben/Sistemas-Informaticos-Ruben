# Resumen de Bash – Comandos, Sintaxis y Ejemplos
## 1. 📜 Creación y Ejecución de Scripts
Estructura básica
```bash
#!/bin/bash   # Intérprete
 Comentario
echo "Hola, mundo"   # Comando
```

Crear y ejecutar un script

nano script.sh        # Crear script
chmod +x script.sh    # Dar permisos
./script.sh           # Ejecutar
# Alternativa:
bash script.sh

2. 👤 Variables en Bash
Declaración
variable="valor"

Uso
echo $variable

Ejemplo
usuario="María"
echo "Hola, $usuario"

🔹 Tipos de variables
```bash
Locales
mensaje="Hola mundo"
echo $mensaje

Globales (del sistema)
echo $HOME
echo $PATH
echo $USER
```

Especiales
Variable	Significado
```bash
$0	Nombre del script
$1, $2	Argumentos
$#	Cantidad de argumentos
$?	Estado de salida
echo "Script: $0"
echo "Primer argumento: $1"
```

3. 🔢 Operaciones con Variables
Aritmética
a=10
b=5
suma=$((a + b))
echo "La suma es: $suma"

Operadores

+ - * / % **

Ejemplo completo:

x=15
y=4
echo $((x + y))
echo $((x - y))
echo $((x * y))
echo $((x / y))
echo $((x % y))
echo $((x ** y))

4. 🔧 Estructuras de Control
4.1. Condicionales if–else
```bash
if [ condición ]; then
    comando
elif [ condición2 ]; then
    comando2
else
    comando3
fi

Ejemplo: Edad
edad=20
if [ $edad -ge 18 ]; then
  echo "Eres mayor de edad"
else
  echo "Eres menor de edad"
fi
```

Operadores numéricos

-eq igual
-ne diferente
-lt menor
-le menor o igual
-gt mayor
-ge mayor o igual

5. 🔁 Bucles
5.1. Bucle for
```bash
for i in {1..5}; do
  echo "Número: $i"
done
```

Lista de palabras:

for nombre in Juan María Luis; do
  echo "Hola, $nombre"
done

5.2. Bucle while
```bash
contador=1
while [ $contador -le 5 ]; do
  echo "Iteración $contador"
  ((contador++))
done
```

6. 📦 Arrays en Bash
7. 
```bash
Declaración
mi_array=("Juan" "María" "Luis" "Ana")

Acceso
echo ${mi_array[0]}   # Juan
echo ${mi_array[2]}   # Luis

Todos los elementos
echo ${mi_array[@]}

Añadir y modificar
mi_array+=("Carlos")
mi_array[1]="Marta"

Longitud
echo ${#mi_array[@]}

Iterar
for nombre in "${mi_array[@]}"; do
  echo "Hola, $nombre"
done
```

Eliminar
unset mi_array[2]

Ejemplos útiles

Listado de archivos:
```bash

archivos=(*.txt)
echo ${archivos[@]}
```


Resultados de comandos:

procesos=($(ps aux | awk '{print $1}'))


Argumentos del script:

argumentos=("$@")
echo "Argumentos: ${argumentos[@]}"