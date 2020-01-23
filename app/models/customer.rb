class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  # とりあえずカタカナ制限入れてません！
  has_many :cart_items, dependent: :destroy
  has_many :ship_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
end
