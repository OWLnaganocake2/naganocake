class AddReferencesToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :genre, null: false, foreign_key: true
  end
end
