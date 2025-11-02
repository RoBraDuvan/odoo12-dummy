# -*- coding: utf-8 -*-
from odoo import models, fields

class ResConfigSettings(models.TransientModel):
    _inherit = 'res.config.settings'

    theme_color_brand = fields.Char(string='Brand Color', help='Primary brand color for the theme')
    theme_color_primary = fields.Char(string='Primary Color', help='Primary color for the theme')
