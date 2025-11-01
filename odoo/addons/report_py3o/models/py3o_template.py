# -*- coding: utf-8 -*-
from odoo import models, fields

class Py3oTemplate(models.Model):
    _name = 'py3o.template'
    _description = 'Py3o Template'

    name = fields.Char(string='Nombre', required=True)
    py3o_template_data = fields.Binary(string='Template')
    filetype = fields.Selection([
        ('odt', 'ODF Text Document'),
        ('ods', 'ODF Spreadsheet'),
    ], string='Tipo de archivo', default='odt')
