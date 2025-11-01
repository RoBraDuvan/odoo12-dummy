# -*- coding: utf-8 -*-
from odoo import models, fields

class MassEditingWizard(models.TransientModel):
    _name = 'mass.editing.wizard'
    _description = 'Mass Editing Wizard'

    name = fields.Char(string='Nombre')
