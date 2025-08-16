# Infraestructura como Código en Linux

Este proyecto contiene un script de Bash para automatizar la creación y gestión de usuarios, grupos y permisos en un entorno Linux, siguiendo principios de Infraestructura como Código (IaC).

## Descripción

El script [`iac_linux.sh`](iac_linux.sh) automatiza las siguientes tareas:

- Eliminación de usuarios y directorios previos (comentado por seguridad).
- Creación de directorios para diferentes departamentos: `publico`, `adm`, `ven`, `sec`.
- Creación de grupos de usuarios: `GRP_ADM`, `GRP_VEN`, `GRP_SEC`.
- Creación de usuarios y asignación a los grupos correspondientes.
- Asignación de permisos y propietarios a los directorios según el grupo.

## Estructura de Directorios y Grupos

- **publico**: Acceso para todos los usuarios.
- **adm**: Acceso exclusivo para el grupo `GRP_ADM`.
- **ven**: Acceso exclusivo para el grupo `GRP_VEN`.
- **sec**: Acceso exclusivo para el grupo `GRP_SEC`.

## Uso

1. Clona este repositorio o descarga el archivo [`iac_linux.sh`](iac_linux.sh).
2. Da permisos de ejecución al script:
   ```sh
   chmod +x iac_linux.sh
   ```
3. Ejecuta el script como superusuario:
   ```sh
   sudo ./iac_linux.sh
   ```

## Notas

- El script utiliza contraseñas encriptadas para los usuarios.
- La eliminación de usuarios está comentada por defecto para evitar borrados accidentales.
- Puedes personalizar los nombres de usuarios, grupos y directorios según tus necesidades.

## Requisitos

- Distribución Linux compatible con los comandos `useradd`, `groupadd`, `chown`, `chmod`, y `openssl`.
- Permisos de superusuario.

## Autor

Asley

---

> **Advertencia:** Usa este script en entornos de prueba antes de implementarlo en producción. Asegúrate de tener copias de seguridad y de entender cada parte del script.


