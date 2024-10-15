class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :amount, null: false
      t.timestamps
    end

  #add_reference :cart_items, :item, foreign_key: true
  #add_reference :cart_items, :customer, foreign_key: true
  end

end