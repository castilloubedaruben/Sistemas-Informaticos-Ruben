#!/bin/bash

"1. crear_directorio
Crea un directorio (usa mkdir -p) y muestra si ya existía o fue creado.

Uso: crear_directorio /ruta/al/directorio
Salida esperada: Directorio '/tmp/prueba' creado o Directorio '/tmp/prueba' ya existe
Validaciones: comprobar número de argumentos y permisos de escritura en la ruta padre."


# Función reutilizable para validar argumentos
# Uso: validar_argumentos <num_esperado> "$@"

validar_argumentos() {
  if [ $# -lt 1 ]; then
    echo "Error interno en validación"
    return 1
  fi

  esperados=$1
  shift

  if [ $# -ne "$esperados" ]; then
    echo "Error: se necesitan $esperados argumentos"
    return 1
  fi

  return 0
}

#1. 
crear_directorio() {

  validar_argumentos 1 "$@" || return 1

  ruta=$1
  padre=$(dirname "$ruta")

  if [ ! -d "$padre" ]; then
    echo "Error: la ruta padre no existe"
    return 1
  fi

  if [ ! -w "$padre" ]; then
    echo "Error: no tienes permisos de escritura en la ruta padre"
    return 1
  fi

  if [ -d "$ruta" ]; then
    echo "Directorio '$ruta' ya existe"
  else
    mkdir -p "$ruta"
    echo "Directorio '$ruta' creado"
  fi

  return 0
}

############################################
# 2. buscar_archivos_grandes
############################################
buscar_archivos_grandes() {

  validar_argumentos 2 "$@" || return 1

  ruta=$1
  size_mb=$2
  size_bytes=$(( size_mb * 1024 * 1024 ))

  if [ ! -d "$ruta" ]; then
    echo "Error: el directorio no existe"
    return 1
  fi

  resultados=$(find "$ruta" -type f -size +"$size_bytes"c)

  if [ -z "$resultados" ]; then
    echo "No se encontraron archivos > $size_mb MB"
  else
    echo "$resultados"
  fi

  return 0
}

############################################
# 3. buscar_por_extension
############################################
buscar_por_extension() {

  if [ $# -lt 2 ]; then
    echo "Uso: buscar_por_extension <ruta> <ext> [-c]"
    return 1
  fi

  ruta=$1
  ext=$2
  modo=$3

  if [ ! -d "$ruta" ]; then
    echo "Error: el directorio no existe"
    return 1
  fi

  resultados=$(find "$ruta" -type f -name "*.$ext")

  if [ "$modo" = "-c" ]; then
    echo "$resultados" | wc -l
  else
    echo "$resultados"
  fi

  return 0
}

############################################
# 4. cambiar_permisos
############################################
cambiar_permisos() {

  validar_argumentos 2 "$@" || return 1

  permisos=$1
  archivo=$2

  if ! [[ "$permisos" =~ ^[0-7]{3,4}$ ]]; then
    echo "Error: formato de permisos inválido"
    return 1
  fi

  if [ ! -f "$archivo" ]; then
    echo "Error: el archivo no existe"
    return 1
  fi

  chmod "$permisos" "$archivo"
  echo "Permisos de '$archivo' cambiados a $permisos"

  return 0
}

############################################
# 5. obtener_propietario
############################################
obtener_propietario() {

  validar_argumentos 1 "$@" || return 1

  archivo=$1

  if [ ! -e "$archivo" ]; then
    echo "Error: el archivo no existe"
    return 1
  fi

  propietario=$(stat -c %U "$archivo")
  grupo=$(stat -c %G "$archivo")

  echo "$archivo: propietario=$propietario grupo=$grupo"

  return 0
}

############################################
# 6. respaldo
############################################
respaldo() {

  validar_argumentos 1 "$@" || return 1

  archivo=$1

  if [ ! -f "$archivo" ]; then
    echo "Error: el archivo no existe"
    return 1
  fi

  timestamp=$(date +%Y%m%d_%H%M%S)
  backup="$archivo.bak-$timestamp"

  cp -- "$archivo" "$backup"

  echo "Backup creado: $backup"

  return 0
}

############################################
# 7. tamaño_directorio (en bits)
############################################
tamaño_directorio() {

  validar_argumentos 1 "$@" || return 1

  ruta=$1

  if [ ! -d "$ruta" ]; then
    echo "Error: el directorio no existe"
    return 1
  fi

  size_bytes=$(du -sb "$ruta" | awk '{print $1}')
  size_bits=$(( size_bytes * 8 ))

  echo "$size_bits"

  return 0
}

############################################
# 8. puerto_abierto
############################################
puerto_abierto() {

  validar_argumentos 2 "$@" || return 1

  host=$1
  puerto=$2

  if command -v nc >/dev/null 2>&1; then
    nc -z -w 3 "$host" "$puerto"
    if [ $? -eq 0 ]; then
      echo "$puerto abierto en $host"
    else
      echo "$puerto cerrado en $host"
    fi
  else
    echo "Error: nc no está disponible"
    return 1
  fi

  return 0
}

############################################
# 9. verificar_conectividad
############################################
verificar_conectividad() {

  validar_argumentos 1 "$@" || return 1

  host=$1

  resultado=$(ping -c 1 "$host")

  if [ $? -eq 0 ]; then
    latencia=$(echo "$resultado" | grep "time=" | awk -F'time=' '{print $2}' | awk '{print $1}')
    echo "$host responde (latencia: $latencia ms)"
  else
    echo "$host no responde"
  fi

  return 0
}



