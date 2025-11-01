#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Script para crear módulos señuelo para Odoo"""

import os

# Lista de módulos a crear con sus dependencias
MODULES = {
    # Módulos Enterprise
    'account_accountant': {'depends': ['account'], 'category': 'Accounting'},
    'account_reports': {'depends': ['account'], 'category': 'Accounting'},
    'stock_enterprise': {'depends': ['stock'], 'category': 'Inventory'},
    'web_cohort': {'depends': ['web'], 'category': 'Web'},
    'web_dashboard': {'depends': ['web'], 'category': 'Web'},
    'web_widget_color': {'depends': ['web'], 'category': 'Web'},
    'web_responsive': {'depends': ['web'], 'category': 'Web'},

    # Módulos OCA/Community
    'account_financial_report': {'depends': ['account'], 'category': 'Accounting'},
    'account_invoice_production_lot': {'depends': ['account', 'stock'], 'category': 'Accounting'},
    'account_tax_code': {'depends': ['account'], 'category': 'Accounting'},
    'auto_database_backup': {'depends': ['base'], 'category': 'Tools'},
    'date_range': {'depends': ['base'], 'category': 'Tools'},
    'local_db_backup': {'depends': ['base'], 'category': 'Tools'},
    'mass_editing': {'depends': ['base'], 'category': 'Tools'},
    'report_py3o': {'depends': ['base'], 'category': 'Reporting'},
    'report_xlsx': {'depends': ['base'], 'category': 'Reporting'},
    'stock_picking_invoice_link': {'depends': ['stock', 'account'], 'category': 'Inventory'},
    'stock_quantity_history_location': {'depends': ['stock'], 'category': 'Inventory'},
    'web_export_view': {'depends': ['web'], 'category': 'Web'},
    'pos_traceability_validation': {'depends': ['point_of_sale'], 'category': 'Point of Sale'},
    'gslab_backend_theme': {'depends': ['web'], 'category': 'Themes'},

    # Módulos custom locales
    'iva_cotrans': {'depends': ['account'], 'category': 'Localization'},
    'iva_facturas_compra': {'depends': ['account'], 'category': 'Localization'},
    'iva_facturas_gv': {'depends': ['account'], 'category': 'Localization'},
    'iva_facturas_venta': {'depends': ['account'], 'category': 'Localization'},
    'iva_fovial': {'depends': ['account'], 'category': 'Localization'},
    'iva_grancontri_compra': {'depends': ['account'], 'category': 'Localization'},
    'iwesabe_reports_journal_entry': {'depends': ['account'], 'category': 'Reporting'},
    'nc_kardex_productos': {'depends': ['stock'], 'category': 'Inventory'},
}

BASE_PATH = r"c:\Users\Duván Andrés\Documents\guevara\odoo\addons"

def create_module(module_name, config):
    """Crea la estructura de un módulo señuelo"""
    module_path = os.path.join(BASE_PATH, module_name)
    models_path = os.path.join(module_path, 'models')

    # Crear directorios
    os.makedirs(models_path, exist_ok=True)

    # Crear __manifest__.py
    manifest_content = f"""# -*- coding: utf-8 -*-
{{
    'name': '{module_name.replace('_', ' ').title()}',
    'version': '12.0.1.0.0',
    'category': '{config['category']}',
    'summary': '{module_name.replace('_', ' ').title()} - Módulo de compatibilidad',
    'description': \"\"\"
        {module_name.replace('_', ' ').title()} - Versión de compatibilidad
        Módulo señuelo para mantener compatibilidad con vistas existentes.
    \"\"\",
    'author': 'Grupo Guevara',
    'depends': {config['depends']},
    'data': [],
    'installable': True,
    'application': False,
    'auto_install': False,
}}
"""

    with open(os.path.join(module_path, '__manifest__.py'), 'w', encoding='utf-8') as f:
        f.write(manifest_content)

    # Crear __init__.py principal
    with open(os.path.join(module_path, '__init__.py'), 'w', encoding='utf-8') as f:
        f.write("# -*- coding: utf-8 -*-\n# Módulo de compatibilidad\n")

    # Crear models/__init__.py vacío
    with open(os.path.join(models_path, '__init__.py'), 'w', encoding='utf-8') as f:
        f.write("# -*- coding: utf-8 -*-\n# Modelos de compatibilidad\n")

    print(f"✓ Módulo {module_name} creado")

if __name__ == '__main__':
    print("Creando módulos señuelo...")
    for module_name, config in MODULES.items():
        create_module(module_name, config)
    print(f"\n✓ {len(MODULES)} módulos creados exitosamente!")
