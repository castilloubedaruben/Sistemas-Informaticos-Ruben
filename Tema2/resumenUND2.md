# 🧩 Unidad Didáctica 2: Gestión de Procesos y Administración de Usuarios y Grupos


## 🔐 2.1. Permisos y Propiedad de Archivos

En Linux, cada archivo o directorio tiene **permisos** que determinan quién puede **leer**, **modificar** o **ejecutar** ese recurso.  
Estos permisos se asignan a **tres entidades**:

| Entidad | Descripción |
|----------|-------------|
| **u (user)** | Propietario del archivo |
| **g (group)** | Grupo asociado |
| **o (others)** | Todos los demás usuarios |

---

### 📋 Tipos de Permisos

| Permiso | Archivos | Directorios |
|----------|-----------|-------------|
| **r (read)** | Leer contenido | Listar archivos |
| **w (write)** | Modificar contenido | Crear/eliminar archivos |
| **x (execute)** | Ejecutar como programa | Acceder al directorio |

---

### 👀 Visualización de Permisos

```bash
ls -l
```

Desglose:

Parte	Significado
-	Archivo regular
rwx	Permisos del propietario (lectura, escritura, ejecución)
r-x	Permisos del grupo (lectura, ejecución)
r--	Permisos de otros (solo lectura)


### ⚙️ Gestión de Permisos con chmod

🔹 Formato Simbólico
```bash
chmod u+x archivo.sh      # Añade ejecución para el propietario
chmod g-w archivo.txt     # Quita escritura al grupo
chmod a=r archivo.conf    # Solo lectura para todos
```
Símbolos usados:

u: usuario
g: grupo
o: otros
a: todos
+: añadir permiso
-: eliminar permiso
=: establecer permiso exacto

🔹 Formato Numérico (Octal)
Valor	Permiso
4	Lectura (r)
2	Escritura (w)
1	Ejecución (x)

Ejemplos:
```bash
chmod 755 archivo.txt   # rwxr-xr-x
chmod 644 documento.txt # rw-r--r--
```

### 👤 Gestión de Propiedad de Archivos

🔹 Cambiar propietario con chown
```bash
chown carlos documento.txt
```

👉 Cambia el propietario a carlos.
```bash
chown carlos:desarrollo proyecto.zip
```

👉 Cambia el propietario a carlos y el grupo a desarrollo.
🔹 Cambiar grupo con chgrp
```bash
chgrp marketing informe.doc
```

## 👥 2.2. Gestión de Usuarios

La gestión de usuarios es esencial para mantener la seguridad y el control de acceso en sistemas Linux.
Cada usuario tiene un perfil con un UID, grupos asociados y un entorno de trabajo.

### 🧍‍♂️ 2.2.1. Creación de Usuarios con adduser
```bash
adduser -m juan
```
👉 Crea el usuario juan con directorio /home/juan.

Opciones comunes:

| Opción                 | Descripción                                  | Ejemplo                                  |
| ---------------------- | -------------------------------------------- | ---------------------------------------- |
| `--home [ruta]`        | Define un directorio de inicio personalizado | `adduser --home /opt/usuarios/juan juan` |
| `--shell [ruta_shell]` | Establece el shell predeterminado            | `adduser --shell /bin/bash juan`         |
| `--ingroup [grupo]`    | Asigna el grupo principal                    | `adduser --ingroup desarrollo juan`      |


### 2.2.2. Eliminación de Usuarios con deluser

```bash
deluser juan
```

👉 Elimina al usuario juan pero conserva su directorio /home/juan.

Opciones útiles

```bash
deluser --remove-home juan       # Elimina su directorio de inicio
deluser --backup juan            # Crea un backup antes de eliminarlo
deluser --remove-all-files juan  # Elimina todos sus archivos del sistema
```

### 🛠️ 2.2.3. Modificación de Usuarios con usermod

Permite modificar cuentas existentes sin eliminarlas.

```bash
usermod -l juanperez juan       # Cambia el nombre de usuario
usermod -d /mnt/almacen/juan juan  # Cambia el directorio de inicio
usermod -g administradores juan # Cambia el grupo principal
usermod -aG sudo juan           # Añade a un grupo secundario
usermod -L juan                 # Bloquea la cuenta
usermod -s /bin/zsh juan        # Cambia el shell predeterminado
```

### 🔎 2.2.4. Visualización de Información de Usuario
🔹 Comando whoami
```bash
whoami
```
👉 Muestra UID, GID y grupos del usuario.

Ejemplo de salida:
```bash
uid=1001(juan) gid=1001(juan) grupos=1001(juan),27(sudo),1002(desarrollo)
```

### 📄 2.2.5. Archivos de Configuración de Usuarios
🗂️ Archivo /etc/passwd

Contiene información básica de las cuentas de usuario.

```bash
usuario:x:UID:GID:comentario:/home/directorio:/bin/shell
```
🗂️ Archivo /etc/group

Define los grupos del sistema

```bash
nombre_grupo:x:GID:miembros
```

## 🧑‍🤝‍🧑 2.3. Gestión de Grupos

Los grupos permiten organizar usuarios con permisos compartidos.
Facilitan el control de acceso y la administración en entornos multiusuario.

🧱 Tipos de Grupos
| Tipo           | Descripción                                              |
| -------------- | -------------------------------------------------------- |
| **Primario**   | Grupo principal del usuario (definido en `/etc/passwd`)  |
| **Secundario** | Grupos adicionales a los que pertenece el usuario        |
| **De Sistema** | Usados por servicios y aplicaciones (sudo, docker, etc.) |


## 🧩 3 Creación de Grupos con groupadd

```bash
groupadd -g 1500 desarrollo
```

Opciones comunes:
| Opción     | Descripción              |
| ---------- | ------------------------ |
| `-g [GID]` | Asigna un ID específico  |
| `-r`       | Crea un grupo de sistema |


### 🗑️ 3.1. Eliminación de Grupos con groupdel

```bash
groupdel desarrollo
```
👉 Elimina el grupo desarrollo.

⚠️ Si un usuario tiene este grupo como primario, primero reasigna otro grupo:
```bash
usermod -g usuarios juan
```
### ✏️ 3.2. Modificación de Grupos con groupmod

```bash
groupmod -n equipo_proyecto desarrollo   # Cambia el nombre del grupo
groupmod -g 2000 equipo_proyecto         # Cambia el GID
```

## 👥 4. Asignación de Usuarios a Grupos
```bash
usermod -aG desarrollo juan  # Añade a grupo secundario
usermod -g desarrollo juan   # Cambia grupo primario
```

## 🔍 5. Visualización de Información de Grupos

```bash
groups juan
# juan : juan desarrollo sudo

getent group desarrollo
# desarrollo:x:1500:juan,pedro
```

## ⚠️ 6. Consideraciones de Seguridad

Controlar el acceso mediante grupos correctamente configurados.

Limitar los privilegios en grupos como sudo o wheel.

Gestionar con precaución las contraseñas de grupo en /etc/gshadow.

| Categoría       | Comando                            | Función                                         |
| --------------- | ---------------------------------- | ----------------------------------------------- |
| **Permisos**    | `chmod`                            | Cambiar permisos de lectura/escritura/ejecución |
| **Propiedad**   | `chown`, `chgrp`                   | Cambiar propietario o grupo de archivos         |
| **Usuarios**    | `adduser`, `deluser`, `usermod`    | Crear, eliminar o modificar usuarios            |
| **Información** | `whoami`, `id`                     | Consultar usuario actual y grupos               |
| **Grupos**      | `groupadd`, `groupdel`, `groupmod` | Crear, eliminar o modificar grupos              |
