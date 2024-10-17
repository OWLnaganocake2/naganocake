class AddReferencesToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :customer, null: false, foreign_key: true
    add_reference :cart_items, :item, null: false, foreign_key: true
  end
end
