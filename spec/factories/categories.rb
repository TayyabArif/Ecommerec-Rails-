FactoryBot.define do
    factory :category do
      category {Faker::Name.unique.first_name}
    end
  end