class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :amount, presence: true
  validates :price, presence: true
  validates :making_status, presence: true
  enum making_status: { "着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }
end
