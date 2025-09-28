class CreateServicesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.boolean :is_active, null: false, default: true
      t.integer :price, null: false
      t.timestamps
    end
    add_index :services, :name, unique: true
  end
end
