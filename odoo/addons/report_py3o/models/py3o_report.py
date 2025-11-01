# -*- coding: utf-8 -*-
from odoo import models, fields

class Py3oReport(models.Model):
    _name = 'py3o.report'
    _description = 'Py3o Report'

    name = fields.Char(string='Nombre')
    py3o_template_id = fields.Many2one('py3o.template', string='Template')
