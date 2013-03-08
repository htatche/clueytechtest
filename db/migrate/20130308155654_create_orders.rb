class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :location_id
      t.integer :terminal_id
      t.integer :quantity
      t.datetime :date

      t.timestamps
    end
  end
end
