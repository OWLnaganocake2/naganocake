class Address < ApplicationRecord
  belongs_to :customer

  validates :post_code, length: {is: 7}, numericality: { only_integer: true }, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def address_display #カリキュラム通りの記述
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
