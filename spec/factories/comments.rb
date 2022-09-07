FactoryBot.define do
    factory :comment do
     title {Faker::Name.name}
     product_id {130}
     association :user
    end
  end