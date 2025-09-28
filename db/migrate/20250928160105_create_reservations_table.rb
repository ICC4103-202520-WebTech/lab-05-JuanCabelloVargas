class CreateReservationsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.string :code, null: false
      t.references :guest, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.integer :status, null: false
      t.integer :adults, null: false
      t.integer :children
      t.timestamps
    end
    add_index :reservations, :code, unique: true
  end
end
