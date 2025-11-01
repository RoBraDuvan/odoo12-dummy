# -*- coding: utf-8 -*-
from odoo import models, fields

class DateRangeType(models.Model):
    _name = 'date.range.type'
    _description = 'Date Range Type'

    name = fields.Char(string='Nombre', required=True)
    allow_overlap = fields.Boolean(string='Allow overlap', default=False)
