class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  validates :total_price, presence: true
  validates :payment_method, inclusion: { in: ["credit_card", "transfer"] }
  validates :shipping_fee, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :status, presence: true
  

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_payment: 0, payment_comfirm: 1, in_production: 2, preparing_for_shipment: 3, delivered: 4}
end
