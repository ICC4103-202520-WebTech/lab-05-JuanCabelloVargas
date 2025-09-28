class CreateInvoicesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices_tables do |t|
      t.references :reservation, null: false, foreign_key: true
      t.integer :nights_subtotal, null: false
      t.integer :servides_subtotal
      t.integer :tax, null: false
      t.integer :total, null: false
      t.datetime :issued_at
      t.string :status
      t.timestamps
    end
  end
end
