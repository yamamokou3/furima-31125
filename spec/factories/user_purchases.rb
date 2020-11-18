FactoryBot.define do
  factory :user_purchase do
    token {"tok_e54b61a58123df2af66547f91ba3"}
    zip_cpde { '123-4567' }
    area_id { 2 }
    municipality { '横浜市金沢区' }
    address { '銀座1-2-3' } 
    phone_number { 12345678910 }
  end
end
