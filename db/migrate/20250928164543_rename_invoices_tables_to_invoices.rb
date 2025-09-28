class RenameInvoicesTablesToInvoices < ActiveRecord::Migration[8.0]
  def change
    rename_table :invoices_tables, :invoices
  end
end
