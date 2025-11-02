# -*- coding: utf-8 -*-
from odoo import models, fields

class ResPartner(models.Model):
    _inherit = 'res.partner'

    # Campos faltantes del módulo de pagos y contabilidad
    partner_ledger_label = fields.Char(
        string='Partner Ledger Label',
        help='Etiqueta para el libro mayor de partners'
    )

    total_due = fields.Float(
        string='Total Due',
        compute='_compute_total_due',
        help='Total amount due from this partner'
    )

    def _compute_total_due(self):
        """Compute total due - simplified version"""
        for partner in self:
            partner.total_due = 0.0
