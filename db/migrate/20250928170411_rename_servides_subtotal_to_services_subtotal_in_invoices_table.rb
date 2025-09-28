class RenameServidesSubtotalToServicesSubtotalInInvoicesTable < ActiveRecord::Migration[8.0]
  def change
    rename_column :invoices, :servides_subtotal, :services_subtotal
  end
end
