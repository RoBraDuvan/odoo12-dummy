-- Script completo para limpiar vistas y acciones problemáticas de módulos desinstalados
-- Base de datos: CONTA

-- 1. Desactivar TODAS las vistas que contengan campos de módulos desinstalados
UPDATE ir_ui_view SET active = 'f'
WHERE id IN (
  SELECT id FROM ir_ui_view
  WHERE active = 't' AND (
    arch_db ~ 'pos_branch_id|delivered_date|pos_loyalty|pos_retail|call_log'
    OR name ~ '(pos_retail|web_cohort|web_dashboard|gslab_backend|account_reports|web_widget_color|web_responsive|account_financial_report|web_studio|report_py3o|web_export_view|date_range|report_xlsx|iva_facturas|iva_cotrans|iva_fovial|kardex_productos|iwesabe_reports|mass_editing|stock_enterprise)'
    OR key ~ '(pos_retail|web_cohort|web_dashboard|gslab_backend|account_reports|web_widget_color|web_responsive|account_financial_report|web_studio|report_py3o|web_export_view|date_range|report_xlsx)'
  )
);

-- 2. Limpiar referencias de search_view_id en acciones que apuntan a vistas desactivadas
UPDATE ir_act_window
SET search_view_id = NULL::INTEGER
WHERE search_view_id IN (
  SELECT id FROM ir_ui_view WHERE active = 'f'
);

-- 3. Limpiar referencias de view_id en acciones que apuntan a vistas desactivadas
UPDATE ir_act_window
SET view_id = NULL::INTEGER
WHERE view_id IN (
  SELECT id FROM ir_ui_view WHERE active = 'f'
);

-- 4. Verificar resultados
SELECT COUNT(*) as "Total vistas desactivadas" FROM ir_ui_view WHERE active = 'f';
SELECT COUNT(*) as "Acciones con search_view limpiado" FROM ir_act_window WHERE search_view_id IS NULL;
