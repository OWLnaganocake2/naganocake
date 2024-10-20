class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 退会機能
  def active_for_authentication?
    super && (is_deleted == false)
  end

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :tell_number, presence: true
  validates :email, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
end
