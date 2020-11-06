class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ァ-ン一-龥]+\z/} do
  validates :first_name, presence: true
  validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  end
  validates :birthday, presence: true
end