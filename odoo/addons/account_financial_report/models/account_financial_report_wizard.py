# -*- coding: utf-8 -*-
from odoo import models, fields

class GeneralLedgerReportWizard(models.TransientModel):
    _name = 'general.ledger.report.wizard'
    _description = 'General Ledger Report Wizard'

    date_from = fields.Date(string='Fecha desde', required=True)
    date_to = fields.Date(string='Fecha hasta', required=True)
    company_id = fields.Many2one('res.company', string='Company')

class JournalLedgerReportWizard(models.TransientModel):
    _name = 'journal.ledger.report.wizard'
    _description = 'Journal Ledger Report Wizard'

    date_from = fields.Date(string='Fecha desde', required=True)
    date_to = fields.Date(string='Fecha hasta', required=True)
    company_id = fields.Many2one('res.company', string='Company')

class TrialBalanceReportWizard(models.TransientModel):
    _name = 'trial.balance.report.wizard'
    _description = 'Trial Balance Report Wizard'

    date_from = fields.Date(string='Fecha desde', required=True)
    date_to = fields.Date(string='Fecha hasta', required=True)
    company_id = fields.Many2one('res.company', string='Company')

class OpenItemsReportWizard(models.TransientModel):
    _name = 'open.items.report.wizard'
    _description = 'Open Items Report Wizard'

    date_at = fields.Date(string='Fecha', required=True)
    company_id = fields.Many2one('res.company', string='Company')

class AgedPartnerBalanceWizard(models.TransientModel):
    _name = 'aged.partner.balance.wizard'
    _description = 'Aged Partner Balance Wizard'

    date_at = fields.Date(string='Fecha', required=True)
    company_id = fields.Many2one('res.company', string='Company')

class VatReportWizard(models.TransientModel):
    _name = 'vat.report.wizard'
    _description = 'VAT Report Wizard'

    date_from = fields.Date(string='Fecha desde', required=True)
    date_to = fields.Date(string='Fecha hasta', required=True)
    company_id = fields.Many2one('res.company', string='Company')

class AccountChangeLockDate(models.TransientModel):
    _name = 'account.change.lock.date'
    _description = 'Account Change Lock Date'

    period_lock_date = fields.Date(string='Lock Date for Non-Advisers')
    fiscalyear_lock_date = fields.Date(string='Lock Date for Advisers')
