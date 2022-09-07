FactoryBot.define do
  factory :user do
    name {Faker::Name.unique.first_name}
    surname {Faker::Name.unique.last_name}
    email {Faker::Internet.email(domain: "gmail.com")}
    password {Faker::Internet.password}
  end
end