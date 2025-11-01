-- Cambiar contraseña del usuario comprasgrupoguevara a 'admin'
-- La contraseña en Odoo se almacena hasheada

UPDATE res_users
SET password = 'admin'
WHERE login = 'comprasgrupoguevara@gmail.com';

-- Verificar el cambio
SELECT id, login, active FROM res_users WHERE login = 'comprasgrupoguevara@gmail.com';

