# -*- coding: utf-8 -*-
from odoo import models, fields

class AccountInvoiceLine(models.Model):
    _inherit = 'account.invoice.line'

    # Campos faltantes del módulo de compras
    purchase_id = fields.Many2one(
        'purchase.order',
        string='Purchase Order',
        help='Purchase order related to this invoice line'
    )

    purchase_line_id = fields.Many2one(
        'purchase.order.line',
        string='Purchase Order Line',
        help='Purchase order line related to this invoice line'
    )

    prod_lot_ids = fields.Many2many(
        'stock.production.lot',
        string='Production Lots',
        help='Serial/Lot numbers for this invoice line'
    )
