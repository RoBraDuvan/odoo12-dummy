# -*- coding: utf-8 -*-
from odoo import models, fields

class DateRange(models.Model):
    _name = 'date.range'
    _description = 'Date Range'

    name = fields.Char(string='Nombre', required=True)
    date_start = fields.Date(string='Fecha inicio', required=True)
    date_end = fields.Date(string='Fecha fin', required=True)
    type_id = fields.Many2one('date.range.type', string='Type')
    company_id = fields.Many2one('res.company', string='Company')
