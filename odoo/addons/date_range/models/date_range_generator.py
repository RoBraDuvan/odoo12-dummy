# -*- coding: utf-8 -*-
from odoo import models, fields

class DateRangeGenerator(models.TransientModel):
    _name = 'date.range.generator'
    _description = 'Date Range Generator'

    date_start = fields.Date(string='Fecha inicio', required=True)
    date_end = fields.Date(string='Fecha fin', required=True)
    type_id = fields.Many2one('date.range.type', string='Type', required=True)
    duration_count = fields.Integer(string='Duration', default=1)
    unit_of_time = fields.Selection([
        ('day', 'Day'),
        ('week', 'Week'),
        ('month', 'Month'),
        ('year', 'Year'),
    ], string='Unit of time', default='month')
