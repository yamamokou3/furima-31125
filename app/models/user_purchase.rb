class UserPurchase
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :zip_code, :area_id, :municipality, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address, 
    validates :phone_number, format: { with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z, message: "Input only number." }

    def save
      Purchase.create(user_id: user_id, item_id: item_id)
      Delivery.create(zip_code: zip_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name,phone_number: phone_number, purchase_id: purchase_id)
  end
end