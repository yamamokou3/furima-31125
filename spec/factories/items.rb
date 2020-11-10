FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { 1000 }
    categroy_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    days_id { 2 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/Railsの処理の流れ_0409のコピー.png'), filename: 'Railsの処理の流れ_0409のコピー.png')
    end
  end
end
