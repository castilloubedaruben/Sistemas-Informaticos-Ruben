# ⏰ Chuleta – Programación de Tareas (cron y at)

---

## 🔁 CRON – Tareas Repetitivas

| Comando | Descripción | Ejemplo |
|----------|--------------|----------|
| `crontab -e` | Editar tareas del usuario actual | — |
| `crontab -l` | Ver tareas programadas | — |
| `crontab -r` | Eliminar todas las tareas del usuario | — |
| `/etc/crontab` | Config global (añade campo de usuario) | `0 0 * * * root /usr/bin/backup.sh` |
| `/etc/cron.daily/` | Scripts diarios | Colocar `.sh` dentro del directorio |
| `/etc/cron.weekly/` | Scripts semanales | Igual formato |

### 🧩 Sintaxis general:

[minuto] [hora] [día_mes] [mes] [día_semana] [comando]


### 🕐 Ejemplos prácticos:

| Descripción | Línea en crontab |
|--------------|------------------|
| Ejecutar script los lunes a las 2:30 | `30 2 * * 1 /ruta/script.sh` |
| Todos los días a medianoche | `0 0 * * * /usr/bin/actualizar.sh` |
| Cada 15 minutos | `*/15 * * * * rm -rf /tmp/*.tmp` |
| 1º de cada mes | `0 0 1 * * /ruta/mensual.sh` |

---

## ⏳ AT – Tareas Puntuales

| Comando | Descripción | Ejemplo |
|----------|--------------|----------|
| `at [hora]` | Programa una tarea para una hora | `at 10:00` |
| `at now + 2 hours` | Ejecuta dentro de 2 horas | `echo "reboot" | at now + 2 hours` |
| `at midnight < script.sh` | Ejecuta script a medianoche | — |
| `atq` | Muestra tareas pendientes | — |
| `atrm [número]` | Elimina tarea programada | `atrm 2` |
| `at -f archivo` | Ejecuta comandos desde un archivo | `at -f tareas.sh 22:00` |
| `-m` | Enviar correo tras ejecución | `at -m noon` |

---

## 🧱 Seguridad

| Archivo | Función |
|----------|----------|
| `/etc/cron.allow` | Usuarios que pueden usar cron |
| `/etc/cron.deny` | Usuarios que no pueden usar cron |
| `/etc/at.allow` | Usuarios que pueden usar at |
| `/etc/at.deny` | Usuarios que no pueden usar at |

---

## ⚙️ Tipos de automatización

| Caso de uso | Herramienta |
|--------------|--------------|
| Tareas repetitivas (backup diario, limpieza, reportes) | **cron** |
| Tareas únicas (reinicio, ejecución puntual) | **at** |

---

✅ **Recordatorio rápido:**
- `*` → todos los valores  
- `,` → lista  
- `-` → rango  
- `*/N` → cada N unidades  
- Días de la semana: 0/7 = domingo, 1 = lunes  

---

💡 **Pro tip:**  
Si algo no se ejecuta, revisa logs en:  
`/var/log/syslog` o `/var/log/cron.log`


