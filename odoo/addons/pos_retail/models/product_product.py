# -*- coding: utf-8 -*-
from odoo import models, fields, api

class ProductProduct(models.Model):
    _inherit = 'product.product'

    # Campos adicionales que puede requerir pos_retail
    # Estos son campos comunes que suelen estar en módulos POS avanzados
    pos_categ_id = fields.Many2one('pos.category', string='Categoría POS', help='Categoría para punto de venta')
