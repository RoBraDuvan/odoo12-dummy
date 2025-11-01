# -*- coding: utf-8 -*-
from odoo import models, fields, api

class SaleOrder(models.Model):
    _inherit = 'sale.order'

    # Campo que faltaba de pos_retail
    delivered_date = fields.Datetime(string='Fecha de entrega', help='Fecha en que se entregó el pedido')
