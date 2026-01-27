## 🧠 Resumen Explicativo: Programación de Tareas en Linux
**🔄 ¿Qué es la programación de tareas?**

Permite automatizar comandos o scripts para ejecutarse en momentos específicos o repetitivos.
➡️ Se usan principalmente dos herramientas:

cron → para tareas periódicas (repetitivas).

at → para tareas puntuales (una sola vez).

### 🕒 2.9.1. Programación Periódica con cron
**📁 ¿Qué es cron?**

Servicio que ejecuta tareas automáticamente a intervalos definidos (minuto, hora, día, semana, mes).
Cada usuario puede tener su propio archivo crontab.

**🧩 Estructura del archivo crontab**

Cada línea del crontab tiene 6 campos:

``` javascript
[minuto] [hora] [día_mes] [mes] [día_semana] [comando]
```

| Campo      | Valores posibles           | Ejemplo           |
| ---------- | -------------------------- | ----------------- |
| minuto     | 0–59                       | 30                |
| hora       | 0–23                       | 2                 |
| día_mes    | 1–31                       | *                 |
| mes        | 1–12 o nombres (jan, feb…) | 1                 |
| día_semana | 0–7 o nombres (sun, mon…)  | 1 (lunes)         |
| comando    | comando o ruta de script   | `/ruta/script.sh` |


**Comodines útiles:**

* → todos los valores posibles

1,15,30 → lista de valores

1-5 → rango

*/15 → cada 15 minutos

**🧠 Gestión de crontab**

crontab -e → editar el crontab del usuario actual

crontab -l → listar tareas del usuario

crontab -r → eliminar todas las tareas del usuario

**⚙️ Ejemplos prácticos**

Descripción	Línea en crontab
Ejecutar script todos los lunes a las 2:30 a.m.	30 2 * * 1 /ruta/comando.sh
Ejecutar todos los días a medianoche	0 0 * * * /usr/bin/actualizar.sh
Limpiar /tmp cada 15 min	*/15 * * * * rm -rf /tmp/*.tmp
Primer día de cada mes a medianoche	0 0 1 * * /ruta/comando_mensual.sh

**🌍 Configuraciones globales**

/etc/crontab → tareas del sistema (con campo adicional “usuario”)

``` javascript
minuto hora día_mes mes día_semana usuario comando
```
Directorios automáticos:

/etc/cron.hourly/

/etc/cron.daily/

/etc/cron.weekly/

/etc/cron.monthly/

### ⏰ 2.9.2. Programación Puntual con at
**📘 ¿Qué es at?**

Permite ejecutar un comando una vez en una fecha y hora concreta (no repetitiva).
Ideal para tareas únicas como copias o apagados programados.

**💡 Sintaxis**

``` javascript
at [hora] [opciones]
```

Formatos válidos para hora:

10:00 → a las 10:00

now + 2 hours → dentro de 2 horas

midnight → medianoche

noon → mediodía

Opciones:

-f archivo → ejecutar comandos desde un archivo.

-m → enviar correo al terminar la tarea.

**🔧 Ejemplos**

Descripción	Comando
Ejecutar copia a las 10:00 a.m.	`echo "tar -czf backup.tar.gz /home/usuario"
Ejecutar script a medianoche	at midnight < /ruta/script.sh
Ejecutar en 2 días	at now + 2 days (abre sesión interactiva)