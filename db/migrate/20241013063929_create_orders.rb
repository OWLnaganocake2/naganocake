class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :total_price, null: false
      t.integer :payment_method, null: false
      t.integer :shipping_fee, null: false
      t.string :post_code, null: false
      t.text :address, null: false
      t.string :name, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
