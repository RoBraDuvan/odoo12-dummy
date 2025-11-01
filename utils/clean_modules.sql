-- Script para limpiar módulos faltantes de Odoo 12
-- Base de datos: CONTA

-- 1. Desinstalar módulos que no tienen archivos disponibles
UPDATE ir_module_module
SET state = 'uninstalled'
WHERE name IN (
    'account_accountant',
    'account_financial_report',
    'account_invoice_production_lot',
    'account_reports',
    'account_tax_code',
    'auto_database_backup',
    'date_range',
    'gslab_backend_theme',
    'iva_cotrans',
    'iva_facturas_compra',
    'iva_facturas_gv',
    'iva_facturas_venta',
    'iva_fovial',
    'iva_grancontri_compra',
    'iwesabe_reports_journal_entry',
    'local_db_backup',
    'mass_editing',
    'nc_kardex_productos',
    'pos_retail',
    'pos_traceability_validation',
    'report_py3o',
    'report_xlsx',
    'stock_enterprise',
    'stock_picking_invoice_link',
    'stock_quantity_history_location',
    'web_cohort',
    'web_dashboard',
    'web_export_view',
    'web_responsive',
    'web_studio',
    'web_widget_color'
);

-- 2. Eliminar acciones programadas (cron jobs) de pos_retail que causan errores
DELETE FROM ir_cron
WHERE model IN ('pos.call.log', 'pos.loyalty.point')
   OR name LIKE '%POS auto%';

-- 3. Eliminar dependencias de módulos
DELETE FROM ir_module_module_dependency
WHERE module_id IN (
    SELECT id FROM ir_module_module
    WHERE name IN (
        'account_accountant',
        'account_financial_report',
        'account_invoice_production_lot',
        'account_reports',
        'account_tax_code',
        'auto_database_backup',
        'date_range',
        'gslab_backend_theme',
        'iva_cotrans',
        'iva_facturas_compra',
        'iva_facturas_gv',
        'iva_facturas_venta',
        'iva_fovial',
        'iva_grancontri_compra',
        'iwesabe_reports_journal_entry',
        'local_db_backup',
        'mass_editing',
        'nc_kardex_productos',
        'pos_retail',
        'pos_traceability_validation',
        'report_py3o',
        'report_xlsx',
        'stock_enterprise',
        'stock_picking_invoice_link',
        'stock_quantity_history_location',
        'web_cohort',
        'web_dashboard',
        'web_export_view',
        'web_responsive',
        'web_studio',
        'web_widget_color'
    )
);

-- 4. Limpiar vistas relacionadas con módulos faltantes
UPDATE ir_ui_view
SET active = false
WHERE model IN ('pos.call.log', 'pos.loyalty.point', 'pos.retail');

-- 5. Limpiar acciones de servidor relacionadas
UPDATE ir_act_server
SET state = 'code', code = '# Disabled due to missing module'
WHERE model_name IN ('pos.call.log', 'pos.loyalty.point');

-- 6. Verificar el estado después de la limpieza
SELECT name, state FROM ir_module_module
WHERE name IN (
    'account_accountant',
    'account_financial_report',
    'pos_retail',
    'web_studio',
    'stock_enterprise'
)
ORDER BY name;
