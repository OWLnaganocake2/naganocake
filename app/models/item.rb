class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  has_one_attached :item_image

  def add_tax_sales_price
    (self.price * 1.10).round
  end  
end