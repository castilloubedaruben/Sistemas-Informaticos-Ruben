# 🧩 Unidad Didáctica 2 – Gestión de Procesos, Usuarios y Grupos (Chuleta)

---

## 🔐 2.1. Permisos y Propiedad de Archivos

| Comando / Concepto | Descripción | Ejemplo |
|--------------------|--------------|----------|
| `ls -l` | Muestra permisos, dueño, grupo, tamaño y fecha. | `-rwxr-xr-- 1 usuario grupo 4096 archivo.txt` |
| Tipos de permiso | `r=lectura (4)` · `w=escritura (2)` · `x=ejecución (1)` |  |
| Entidades | `u=usuario` · `g=grupo` · `o=otros` · `a=todos` |  |
| **chmod (simbólico)** | Cambia permisos con letras. | `chmod u+x archivo.sh` (añade exec al usuario) |
|  |  | `chmod g-w archivo.txt` (quita escritura al grupo) |
|  |  | `chmod a=r archivo.conf` (solo lectura para todos) |
| **chmod (numérico)** | Cambia permisos con números octales. | `chmod 755 archivo` → `rwxr-xr-x` |
|  |  | `chmod 644 documento` → `rw-r--r--` |
| **chown** | Cambia propietario (y grupo opcionalmente). | `chown carlos archivo.txt` |
|  |  | `chown carlos:desarrollo proyecto.zip` |
| **chgrp** | Cambia solo el grupo. | `chgrp marketing informe.doc` |

---

## 👨‍💻 2.2. Gestión de Usuarios

| Comando | Descripción | Ejemplo |
|----------|--------------|----------|
| **adduser** | Crea usuario y su directorio `/home`. | `adduser -m juan` |
|  | Cambia directorio/shell/grupo inicial. | `adduser --home /opt/usuarios/juan juan`<br>`adduser --shell /bin/bash juan`<br>`adduser --ingroup devs juan` |
| **deluser** | Elimina usuario. | `deluser juan` |
|  | Borra su /home. | `deluser --remove-home juan` |
|  | Hace backup antes de borrar. | `deluser --backup juan` |
| **usermod** | Modifica datos del usuario. | `usermod -l juanperez juan` (cambia nombre) |
|  | Cambia home. | `usermod -d /mnt/almacen/juan juan` |
|  | Cambia grupo principal. | `usermod -g admin juan` |
|  | Añade a grupo secundario. | `usermod -aG sudo juan` |
|  | Bloquea/desbloquea cuenta. | `usermod -L juan` / `usermod -U juan` |
|  | Cambia shell. | `usermod -s /bin/zsh juan` |
| **whoami** | Muestra usuario actual. | `whoami` → `admin` |
| **id** | Muestra UID, GID y grupos. | `id juan` → `uid=1001 gid=1001 grupos=1001,27(sudo)` |
| **/etc/passwd** | Datos de usuarios. | `usuario:x:UID:GID:comentario:/home:/bin/bash` |
| **/etc/group** | Datos de grupos. | `grupo:x:GID:miembros` |

---

## 👥 2.3. Gestión de Grupos

| Comando | Descripción | Ejemplo |
|----------|--------------|----------|
| **groupadd** | Crea grupo nuevo. | `groupadd -g 1500 desarrollo` |
|  | Grupo del sistema. | `groupadd -r syslog` |
| **groupdel** | Elimina grupo. | `groupdel desarrollo` |
|  | Si es grupo primario de un usuario, primero reasigna. | `usermod -g usuarios juan` |
| **groupmod** | Modifica grupo. | `groupmod -n equipo_proyecto desarrollo` |
|  | Cambia GID. | `groupmod -g 1600 desarrollo` |
| **Asignar usuario a grupo** | Grupo secundario. | `usermod -aG desarrollo juan` |
|  | Grupo primario. | `usermod -g desarrollo juan` |
| **groups** | Muestra los grupos del usuario. | `groups juan` |
| **getent group** | Muestra info detallada del grupo. | `getent group desarrollo` → `desarrollo:x:1500:juan,pedro` |
| **Tipos de grupo** | Primario (principal), Secundario (extra), Sistema (servicios) |  |

---

## ⚙️ 2.4. Permisos y Roles de Superusuario (sudo)

| Comando | Descripción | Ejemplo |
|----------|--------------|----------|
| **sudo** | Ejecuta comandos con privilegios root. | `sudo apt update` |
|  | Ejecutar como otro usuario. | `sudo -u www-data ls /var/www` |
|  | Shell root temporal. | `sudo -s` |
| **visudo** | Edita `/etc/sudoers` de forma segura. | `sudo visudo` |
| **Reglas en sudoers** |  |  |
| Usuario con todos los permisos. | `juan ALL=(ALL) ALL` |
| Usuario con un comando específico. | `carlos ALL=(ALL) /sbin/shutdown` |
| Grupo con permisos completos. | `%admin ALL=(ALL) ALL` |
| **Alias** | Agrupa usuarios o comandos. | `User_Alias ADMINS = juan,carlos,maria`<br>`Cmnd_Alias SHUTDOWN_CMDS = /sbin/shutdown, /sbin/reboot` |
| **NOPASSWD** | No pide contraseña (útil en scripts). | `juan ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart apache2` |
| **Logs sudo** | Guarda acciones en `/var/log/auth.log`. |  |
| **sudo vs su** | `sudo`: controlado y auditable. <br> `su`: cambia de usuario completo, menos seguro. | `su - juan` |

---

## 🔒 Buenas prácticas con sudo
- 🔸 Usa **principio de mínimo privilegio**.  
- 🔸 Asigna permisos mediante **grupos** (`sudo`, `wheel`, `admin`).  
- 🔸 **No desactives** la contraseña en sudo.  
- 🔸 **Audita logs**: `/var/log/auth.log`.  

---

## 🧠 Recordatorios rápidos

| Permiso | Valor | Significado |
|----------|--------|-------------|
| r | 4 | lectura |
| w | 2 | escritura |
| x | 1 | ejecución |

**Ejemplo de cálculo:**  
`rwxr-xr--` → `7 5 4` → `chmod 754 archivo`

---

✅ **Consejo examen:**  
Recuerda:  
- `chown` = cambio de **propietario**  
- `chgrp` = cambio de **grupo**  
- `chmod` = cambio de **permisos**  
- `adduser` / `deluser` = gestión básica  
- `usermod` = modificar  
- `sudo` = permisos temporales de root  

---


