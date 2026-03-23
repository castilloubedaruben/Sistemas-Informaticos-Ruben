# Chuleta Examen - JSON Server + curl + jq
## 📌 1. Preparación básica
Crear archivo base de datos: nano db.json

**Ejemplo:**
```bash
{
  "personas": [
    {
      "id": 1,
      "nombre": "Ana",
      "edad": 28,
      "ciudad": "Granada",
      "coches": [
        { "marca": "Seat", "modelo": "Ibiza", "anio": 2018, "color": "rojo" },
        { "marca": "Ford", "modelo": "Focus", "anio": 2020, "color": "azul" }
      ]
    },
    {
      "id": 2,
      "nombre": "Luis",
      "edad": 35,
      "ciudad": "Madrid",
      "coches": [
        { "marca": "BMW", "modelo": "320", "anio": 2019, "color": "negro" }
      ]
    }
  ]
}
```

### Arrancar servidor

```bash
json-server --watch db.json --port 3000
```

## 2. Consultas básicas (GET)

1. Ver todas las personas
```bash
curl http://localhost:3000/personas
```
2. Ver una persona por ID
```bash
curl http://localhost:3000/personas/2
```
3. Ver la segunda persona del array
```bash
curl http://localhost:3000/personas | jq '.[1]'
```
4. Mostrar solo los nombres
```bash
curl http://localhost:3000/personas | jq '.[].nombre'
```
5. Mostrar solo la edad de una persona
```bash
curl http://localhost:3000/personas/2 | jq '.edad'
```

## 3. Insertar datos (POST)
1. Añadir nueva persona
```bash
curl -X POST http://localhost:3000/personas \
-H "Content-Type: application/json" \
-d '{"nombre":"Carlos","edad":42,"ciudad":"Sevilla","coches":[{"marca":"Audi","modelo":"A3","anio":2022,"color":"blanco"}]}'
```

##  4. Modificar datos (PATCH)
1. Cambiar edad de una persona
```bash
curl -X PATCH http://localhost:3000/personas/3 \
-H "Content-Type: application/json" \
-d '{"edad":50}'
```

2. Cambiar ciudad de una persona
```bash
curl -X PATCH http://localhost:3000/personas/2 \
-H "Content-Type: application/json" \
-d '{"ciudad":"Sevilla"}'
```
3. Añadir un coche (actualizando array)
```bash
curl -X PATCH http://localhost:3000/personas/1 \
-H "Content-Type: application/json" \
-d '{
  "coches": [
    { "marca": "Seat", "modelo": "Ibiza", "anio": 2018, "color": "rojo" },
    { "marca": "Ford", "modelo": "Focus", "anio": 2020, "color": "azul" },
    { "marca": "Toyota", "modelo": "Corolla", "anio": 2022, "color": "blanco" }
  ]
}'
```
## 5. Eliminar datos (DELETE)
1.  Eliminar una persona
```bash
curl -X DELETE http://localhost:3000/personas/3
```
## 6. Filtros con jq
```bash
1.  Personas mayores de 30
curl http://localhost:3000/personas | jq '[.[] | select(.edad > 30)]'
```
2.  Personas menores de 30
 ```bash
curl http://localhost:3000/personas | jq '[.[] | select(.edad < 30)]'
```
3.  Personas de una ciudad
```bash
curl http://localhost:3000/personas | jq '[.[] | select(.ciudad == "Granada")]'
```
4.  Personas sin coches
```bash
curl http://localhost:3000/personas | jq '[.[] | select((.coches | length) == 0)]'
```
5.  Personas con más de un coche
```bash
curl http://localhost:3000/personas | jq '[.[] | select((.coches | length) > 1)]'
```

## 7. Trabajar con coches

1.  Ver todos los coches de una persona
```bash
curl http://localhost:3000/personas/1 | jq '.coches'
```
2.  Ver solo matrículas / modelos
```bash
curl http://localhost:3000/personas/1 | jq '.coches[].modelo'
```
3.  Ver primer coche
```bash
curl http://localhost:3000/personas/1 | jq '.coches[0]'
```
4.  Contar coches
```bash
curl http://localhost:3000/personas/1 | jq '.coches | length'
```
5.  Coches de color rojo
```bash
curl http://localhost:3000/personas/1 | jq '[.coches[] | select(.color == "rojo")]'
```

## 8. Nivel un poco más alto
1.  Personas con coche marca Ford
```bash
curl http://localhost:3000/personas | jq '[.[] | select(any(.coches[]; .marca == "Ford"))]'
```
2.  Nombre + coches posteriores a 2019
```bash
curl http://localhost:3000/personas | jq '[.[] | {nombre: .nombre, coches: [.coches[] | select(.anio > 2019)]}]'
```
## 9. Explicación rápida de comandos
**curl**: Hace peticiones HTTP (GET, POST, PATCH, DELETE)

**jq** :Filtra y transforma JSON

**|** :Pipe → pasa el resultado de un comando a otro

**2> /dev/null** :Oculta errores

## 10. Mini resumen para memorizar
### GET
curl http://localhost:3000/personas

### GET por id
curl http://localhost:3000/personas/1

### POST
curl -X POST URL -H "Content-Type: application/json" -d '{}'

### PATCH
curl -X PATCH URL -H "Content-Type: application/json" -d '{}'

### DELETE
curl -X DELETE URL

### FILTRAR
curl URL | jq '.[] | select(...)'

## 11. Mini chuleta
```bash
# arrancar servidor
json-server --watch db.json --port 3000

# ver todo
curl http://localhost:3000/personas

# ver una persona por id
curl http://localhost:3000/personas/1

# ver la segunda del array
curl http://localhost:3000/personas | jq '.[1]'

# añadir persona
curl -X POST http://localhost:3000/personas \
-H "Content-Type: application/json" \
-d '{"nombre":"Pepe","edad":40,"coches":[{"marca":"Opel","modelo":"Corsa","matricula":"2222BBB"}]}'

# cambiar solo edad
curl -X PATCH http://localhost:3000/personas/3 \
-H "Content-Type: application/json" \
-d '{"edad":33}'

# personas mayores de 30
curl http://localhost:3000/personas | jq '[.[] | select(.edad > 30)]'

# solo coches de una persona
curl http://localhost:3000/personas/1 | jq '.coches'
```

## 🎯 CONSEJO FINAL EXAMEN

👉 Orden mental:

Crear db.json
Levantar json-server
Usar curl para pedir datos
Usar jq para filtrar

👉 Claves:

GET = consultar
POST = añadir
PATCH = modificar
DELETE = borrar