#!/bin/bash
# Script para actualizar módulos en el servidor Linux

echo "==================================================="
echo "ACTUALIZANDO MÓDULOS ODOO EN LINUX"
echo "==================================================="
echo ""

# Lista de módulos a actualizar (incluye módulos web para regenerar assets)
MODULOS="web_studio,stock_enterprise,report_py3o,mass_editing,date_range,account_financial_report,nc_kardex_productos,web,web_enterprise,gslab_backend_theme,account_payment_partner,purchase_invoice_link"

echo "Módulos a actualizar: $MODULOS"
echo ""

# Detener Odoo completamente
echo "1. Deteniendo Odoo completamente..."
docker compose stop odoo
docker compose down odoo 2>/dev/null || true
sleep 3
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

# Limpiar cache de assets (eliminar assets compilados)
echo "3. Limpiando cache de assets JavaScript/CSS..."
docker compose up -d databaseodoo
sleep 3
docker compose exec -T databaseodoo psql -U odoo -d CONTA -c "DELETE FROM ir_attachment WHERE name LIKE '%assets%' OR name LIKE '%.js' OR name LIKE '%.css';"
echo "   ✓ Cache de assets eliminado"
echo ""

# Actualizar módulos (iniciando temporalmente el contenedor)
echo "4. Actualizando módulos..."
docker compose up -d odoo
sleep 5
docker compose exec -T odoo sh -c "odoo -c /etc/odoo/odoo.conf -d CONTA -u $MODULOS --stop-after-init"
docker compose stop odoo
echo "   ✓ Módulos actualizados"
echo ""

# Iniciar Odoo final
echo "5. Iniciando Odoo..."
docker compose up -d odoo
sleep 5
echo "   ✓ Odoo iniciado"
echo ""

echo "==================================================="
echo "ACTUALIZACIÓN COMPLETADA"
echo "==================================================="
echo ""
echo "Verifica los logs con:"
echo "  docker logs odoo --tail 100"
echo ""
echo "Consejos:"
echo "  - Los mensajes 'Missing model' en INFO (blanco) son normales"
echo "  - El error 'odoo.define is not a function' debería estar resuelto"
echo "  - Intenta hacer login ahora en el navegador"
