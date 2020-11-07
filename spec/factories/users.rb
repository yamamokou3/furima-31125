FactoryBot.define do
  factory :user do
    nickname   {Faker::Name.initials(number: 2)}
    email      {Faker::Internet.free_email}
    password {"aaaaa1"}
    password_confirmation {"aaaaa1"}
    first_name {"山田"}
    last_name {"太郎"}
    first_name_kana {"ヤマダ"}
    last_name_kana {"タロウ"}
    birthday {"2000-01-01"}
  end
end