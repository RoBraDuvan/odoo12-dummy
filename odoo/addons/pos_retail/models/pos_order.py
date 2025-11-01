# -*- coding: utf-8 -*-
from odoo import models, fields, api

class PosOrder(models.Model):
    _inherit = 'pos.order'

    # Campos que faltaban de pos_retail
    pos_branch_id = fields.Many2one('res.partner', string='Sucursal', help='Sucursal donde se realizó la venta')
    delivery_date = fields.Datetime(string='Fecha de entrega', help='Fecha programada de entrega')
