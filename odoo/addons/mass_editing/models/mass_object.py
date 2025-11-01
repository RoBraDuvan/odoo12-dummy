# -*- coding: utf-8 -*-
from odoo import models, fields

class MassObject(models.Model):
    _name = 'mass.object'
    _description = 'Mass Editing Object'

    name = fields.Char(string='Nombre', required=True)
    model_id = fields.Many2one('ir.model', string='Model', required=True)
    field_ids = fields.Many2many('ir.model.fields', string='Fields')
