class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  # カタカナ制限
  validates :phone_number, presence: true
  # ！！！電話番号の検証は現状空白のみ！！！
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  # 郵便番号のフォーマット指定 ３桁の数字 + ハイフン + ４桁の数字 Viewのフォーム設定
  validates :address, presence: true
  has_many :cart_items, dependent: :destroy
  has_many :ship_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
end
