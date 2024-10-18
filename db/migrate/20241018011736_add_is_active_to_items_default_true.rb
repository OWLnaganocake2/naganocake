class AddIsActiveToItemsDefaultTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :is_active, from: false, to: true
  end
end
