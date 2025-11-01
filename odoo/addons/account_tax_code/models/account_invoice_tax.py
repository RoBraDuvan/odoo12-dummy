# -*- coding: utf-8 -*-
from odoo import models, fields

class AccountInvoiceTax(models.Model):
    _inherit = 'account.invoice.tax'

    tax_code = fields.Char(string='Código de Impuesto', help='Código del impuesto')
