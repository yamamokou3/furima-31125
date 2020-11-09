class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categroy
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :categroy_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :burden_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :days_id, numericality: { other_than: 1 }
    validates :price
  end
end
