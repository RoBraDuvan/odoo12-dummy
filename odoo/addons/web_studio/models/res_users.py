# -*- coding: utf-8 -*-
from odoo import models, fields

class ResUsers(models.Model):
    _inherit = 'res.users'

    # Campo que faltaba de web_studio
    chatter_position = fields.Selection([
        ('normal', 'Normal'),
        ('sided', 'Sided')
    ], string='Posición del Chatter', default='normal',
       help='Posición del chatter en las vistas de formulario')
