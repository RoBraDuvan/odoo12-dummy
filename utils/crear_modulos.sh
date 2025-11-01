#!/bin/bash
BASE_PATH="c:/Users/Duván Andrés/Documents/guevara/odoo/addons"

create_module() {
    local name=$1
    local category=$2
    local depends=$3
    
    mkdir -p "$BASE_PATH/$name/models"
    
    # __manifest__.py
    cat > "$BASE_PATH/$name/__manifest__.py" << EOF
# -*- coding: utf-8 -*-
{
    'name': '${name//_/ }',
    'version': '12.0.1.0.0',
    'category': '$category',
    'summary': '${name//_/ } - Módulo de compatibilidad',
    'author': 'Grupo Guevara',
    'depends': [$depends],
    'data': [],
    'installable': True,
    'application': False,
}
EOF

    # __init__.py
    echo "# -*- coding: utf-8 -*-" > "$BASE_PATH/$name/__init__.py"
    
    # models/__init__.py
    echo "# -*- coding: utf-8 -*-" > "$BASE_PATH/$name/models/__init__.py"
    
    echo "✓ $name"
}

# Enterprise modules
create_module "account_accountant" "Accounting" "'account'"
create_module "account_reports" "Accounting" "'account'"
create_module "stock_enterprise" "Inventory" "'stock'"
create_module "web_cohort" "Web" "'web'"
create_module "web_dashboard" "Web" "'web'"
create_module "web_widget_color" "Web" "'web'"
create_module "web_responsive" "Web" "'web'"

# OCA/Community modules
create_module "account_financial_report" "Accounting" "'account'"
create_module "account_invoice_production_lot" "Accounting" "'account', 'stock'"
create_module "account_tax_code" "Accounting" "'account'"
create_module "auto_database_backup" "Tools" "'base'"
create_module "date_range" "Tools" "'base'"
create_module "local_db_backup" "Tools" "'base'"
create_module "mass_editing" "Tools" "'base'"
create_module "report_py3o" "Reporting" "'base'"
create_module "report_xlsx" "Reporting" "'base'"
create_module "stock_picking_invoice_link" "Inventory" "'stock', 'account'"
create_module "stock_quantity_history_location" "Inventory" "'stock'"
create_module "web_export_view" "Web" "'web'"
create_module "pos_traceability_validation" "Point of Sale" "'point_of_sale'"
create_module "gslab_backend_theme" "Themes" "'web'"

# Custom local modules
create_module "iva_cotrans" "Localization" "'account'"
create_module "iva_facturas_compra" "Localization" "'account'"
create_module "iva_facturas_gv" "Localization" "'account'"
create_module "iva_facturas_venta" "Localization" "'account'"
create_module "iva_fovial" "Localization" "'account'"
create_module "iva_grancontri_compra" "Localization" "'account'"
create_module "iwesabe_reports_journal_entry" "Reporting" "'account'"
create_module "nc_kardex_productos" "Inventory" "'stock'"

echo "Todos los módulos creados!"
