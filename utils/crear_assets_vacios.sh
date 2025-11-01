#!/bin/bash
BASE="c:/Users/Duván Andrés/Documents/guevara/odoo/addons"

# web_cohort
mkdir -p "$BASE/web_cohort/static/src/scss"
echo "/* Archivo vacío de compatibilidad */" > "$BASE/web_cohort/static/src/scss/web_cohort.scss"

# web_dashboard
mkdir -p "$BASE/web_dashboard/static/src/scss"
echo "/* Archivo vacío de compatibilidad */" > "$BASE/web_dashboard/static/src/scss/dashboard_view.scss"

# account_reports
mkdir -p "$BASE/account_reports/static/src/scss"
echo "/* Archivo vacío de compatibilidad */" > "$BASE/account_reports/static/src/scss/account_financial_report.scss"

# web_widget_color
mkdir -p "$BASE/web_widget_color/static/src/scss"
echo "/* Archivo vacío de compatibilidad */" > "$BASE/web_widget_color/static/src/scss/widget.scss"

# web_responsive
mkdir -p "$BASE/web_responsive/static/src/css"
echo "/* Archivo vacío de compatibilidad */" > "$BASE/web_responsive/static/src/css/web_responsive.scss"

# gslab_backend_theme
mkdir -p "$BASE/gslab_backend_theme/static/src/css"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/colors.scss"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/variables.scss"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/web.scss"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/button.scss"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/calendar.scss"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/list.scss"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/search.scss"
echo "/* Archivo vacío */" > "$BASE/gslab_backend_theme/static/src/css/nav_tab.scss"

# account_financial_report
mkdir -p "$BASE/account_financial_report/static/src/css"
echo "/* Archivo vacío de compatibilidad */" > "$BASE/account_financial_report/static/src/css/report.css"

echo "✓ Archivos CSS/SCSS vacíos creados"
