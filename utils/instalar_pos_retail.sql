-- Script para instalar el módulo pos_retail (versión de compatibilidad)
-- Base de datos: CONTA

-- Marcar el módulo pos_retail para instalar
UPDATE ir_module_module
SET state = 'to install'
WHERE name = 'pos_retail';

-- Verificar el cambio
SELECT name, state FROM ir_module_module WHERE name = 'pos_retail';
