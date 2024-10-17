class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :post_cade, presence: true
  validates :address, presence: true
  validates :tell_number, presence: true
  validates :email, presence: true
  
  has_many :cart_items, dependent: :destroy
end
