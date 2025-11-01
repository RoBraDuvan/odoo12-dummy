# -*- coding: utf-8 -*-
from odoo import models, fields

class StockReport(models.Model):
    _name = 'stock.report'
    _description = 'Stock Report'
    _auto = False  # No crear tabla en la base de datos

    name = fields.Char(string='Nombre')
    date = fields.Date(string='Fecha')
