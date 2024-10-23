class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :amount, presence: true
  validates :price, presence: true
  validates :making_status, presence: true
  enum making_status: { unable_to_start: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }
  
end
