class UserPurchase
  include ActiveModel::Model 
  attr_accessor :token, :user_id, :item_id, :zip_cpde, :area_id, :municipality, :address, :building_name, :phone_number, :purchase_id


  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :zip_cpde, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/
    validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX, message: "Input only number." }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(zip_cpde: zip_cpde, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end