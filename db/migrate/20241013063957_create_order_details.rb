class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :amount, null: false
      t.integer :price, null:false
      t.integer :making_status, null:false  #enumで管理,{0:製作不可,1:製作待ち,2:製作中.3:製作完了}

      t.timestamps
    end
  end
end
