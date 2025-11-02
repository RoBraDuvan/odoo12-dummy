# -*- coding: utf-8 -*-
from odoo import models, fields

class ResPartner(models.Model):
    _inherit = 'res.partner'

    # Campo faltante del módulo de pagos
    partner_ledger_label = fields.Char(
        string='Partner Ledger Label',
        help='Etiqueta para el libro mayor de partners'
    )
