class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    validates :password, presence: true
    validates :password_confirmation, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ン一-龥]+\z/ } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end

  has_many :items
  has_many :purchases
end
