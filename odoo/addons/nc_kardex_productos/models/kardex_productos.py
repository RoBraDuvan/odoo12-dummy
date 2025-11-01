# -*- coding: utf-8 -*-
from odoo import models, fields

class KardexProductosMov(models.Model):
    _name = 'kardex.productos.mov'
    _description = 'Kardex Productos Movimiento'

    name = fields.Char(string='Nombre')
    date = fields.Date(string='Fecha')
    product_id = fields.Many2one('product.product', string='Producto')
    quantity = fields.Float(string='Cantidad')
