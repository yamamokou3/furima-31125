class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categroy
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40}
    validates :description, length: { maximum: 1000}
    validates :categroy_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :burden_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :days_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
