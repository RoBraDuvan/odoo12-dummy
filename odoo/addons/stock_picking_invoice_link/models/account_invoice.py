# -*- coding: utf-8 -*-
from odoo import models, fields

class AccountInvoice(models.Model):
    _inherit = 'account.invoice'

    picking_ids = fields.Many2many(
        'stock.picking',
        string='Albaranes',
        help='Albaranes relacionados con esta factura',
        copy=False
    )
