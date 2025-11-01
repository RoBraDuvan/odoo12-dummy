# -*- coding: utf-8 -*-
from odoo import models, fields, api

class PosConfig(models.Model):
    _inherit = 'pos.config'

    # Campo que faltaba de pos_retail
    pos_branch_id = fields.Many2one('res.partner', string='Sucursal POS', help='Sucursal asociada a este punto de venta')
