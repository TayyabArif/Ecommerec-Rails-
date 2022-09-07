FactoryBot.define do
    factory :product do
      title {Faker::Name.unique.first_name}
      description {Faker::Name.unique.last_name}
      price {Faker::Number.binary(digits: 4)}
      association :user
      association :category
    end
  end