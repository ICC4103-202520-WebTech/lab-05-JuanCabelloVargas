class RenameServiceUsagesTablesToServiceUsages < ActiveRecord::Migration[8.0]
  def change
    rename_table :service_usages_tables, :service_usages
  end
end
