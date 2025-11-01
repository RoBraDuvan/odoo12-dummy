#!/bin/bash
# Script para actualizar módulos en el servidor Linux

echo "==================================================="
echo "ACTUALIZANDO MÓDULOS ODOO EN LINUX"
echo "==================================================="
echo ""

# Lista de módulos a actualizar
MODULOS="stock_enterprise,report_py3o,mass_editing,date_range,account_financial_report,nc_kardex_productos"

echo "Módulos a actualizar: $MODULOS"
echo ""

# Detener Odoo
echo "1. Deteniendo Odoo..."
docker-compose stop odoo
echo "   ✓ Odoo detenido"
echo ""

# Arreglar permisos
echo "2. Arreglando permisos..."
cd odoo/addons
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
sudo chown -R 101:101 .
cd ../..
echo "   ✓ Permisos arreglados"
echo ""

# Iniciar Odoo
echo "3. Iniciando Odoo..."
docker-compose start odoo
sleep 5
echo "   ✓ Odoo iniciado"
echo ""

# Actualizar módulos
echo "4. Actualizando módulos..."
docker exec odoo sh -c "odoo -c /etc/odoo/odoo.conf -d CONTA -u $MODULOS --stop-after-init"
echo "   ✓ Módulos actualizados"
echo ""

# Reiniciar Odoo final
echo "5. Reinicio final de Odoo..."
docker-compose restart odoo
echo "   ✓ Odoo reiniciado"
echo ""

echo "==================================================="
echo "ACTUALIZACIÓN COMPLETADA"
echo "==================================================="
echo ""
echo "Verifica los logs con:"
echo "  docker logs odoo --tail 100"
echo ""
echo "Los mensajes 'Missing model' deberían haber desaparecido."
