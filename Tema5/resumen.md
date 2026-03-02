# 🧠 RESUMEN – FUNCIONES EN BASH (Conceptos Clave)

## 1️⃣ ¿Qué es una función en Bash?

Una **función** es un bloque de código reutilizable que:
- Organiza mejor el script
- Evita repetir código
- Mejora la legibilidad y mantenimiento

---

## 2️⃣ Sintaxis Básica

```bash
nombre_funcion() {
  # comandos
}
```

## 3️⃣ Argumentos en Funciones

Las funciones pueden recibir argumentos al llamarse:

```bash
mi_funcion arg1 arg2
```

| Variable | Significado                |
| -------- | -------------------------- |
| `$1`     | Primer argumento           |
| `$2`     | Segundo argumento          |
| `$@`     | Todos los argumentos       |
| `$#`     | Número total de argumentos |


## 4️⃣ Retorno de Valores

En Bash:

return → solo devuelve códigos de estado (0–255)

Para devolver valores reales → usar echo

Ejemplo:

```bash
sumar() {
  echo $(($1 + $2))
}

resultado=$(sumar 5 3)
echo $resultado
```

## 5️⃣ Validación de Argumentos

Es buena práctica verificar la cantidad de argumentos:

```bash
mi_funcion() {
  if [ $# -ne 2 ]; then
    echo "Uso: mi_funcion <arg1> <arg2>"
    return 1
  fi
}
```

-ne → distinto de

-eq → igual

-gt → mayor que

-lt → menor que

## 6️⃣ Recorrer Argumentos con $@

```bash
for arg in "$@"; do
  echo "$arg"
done
```

## 7️⃣ Uso de shift

shift elimina el primer argumento y desplaza los demás:

Antes:

```bash
$1 $2 $3
```

Después de shift:

```bash
$2 → $1
$3 → $2
```

Ejemplo:

```bash
while [ $# -gt 0 ]; do
  echo "$1"
  shift
done
```

✔ Ideal para procesar argumentos dinámicamente.

## 8️⃣ Estructura Recomendada de una Función Completa

```bash
mi_funcion() {

  # 1. Validar argumentos
  if [ $# -eq 0 ]; then
    echo "Error: faltan argumentos"
    return 1
  fi

  # 2. Lógica principal
  while [ $# -gt 0 ]; do
    echo "Procesando: $1"
    shift
  done

  # 3. Código de salida
  return 0
}
```

## 🎯 Conceptos MÁS importantes para hacer funciones

✅ Declararlas antes de usarlas

✅ Usar $1, $2, $@, $#

✅ Validar argumentos

✅ Usar echo para devolver valores

✅ Usar shift para listas variables

✅ Usar return para códigos de estado

✅ Mantener funciones pequeñas y con una sola responsabilidad