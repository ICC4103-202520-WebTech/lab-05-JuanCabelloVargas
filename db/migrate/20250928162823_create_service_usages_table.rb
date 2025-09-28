class CreateServiceUsagesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :service_usages_tables do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.datetime :used_at, null: false
      t.text :note
      t.timestamps
    end
  end
end
