#!/bin/bash
# Script para arreglar permisos de los módulos de Odoo en Linux

# Cambiar al directorio de addons
cd "$(dirname "$0")/odoo/addons" || exit 1

echo "Arreglando permisos de módulos en $(pwd)..."

# Dar permisos de lectura y ejecución a todos los directorios
find . -type d -exec chmod 755 {} \;

# Dar permisos de lectura a todos los archivos
find . -type f -exec chmod 644 {} \;

# Hacer ejecutables los archivos .sh
find . -type f -name "*.sh" -exec chmod 755 {} \;

# Cambiar propietario a odoo:odoo (ajusta según tu configuración)
# Descomenta la siguiente línea si es necesario
# sudo chown -R odoo:odoo .

echo "Permisos arreglados correctamente."
echo ""
echo "Módulos encontrados:"
ls -la | grep "^d" | wc -l
