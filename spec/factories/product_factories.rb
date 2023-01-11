FactoryBot.define do
  factory :product do
    name { Faker::Device.model_name }
    description { Faker::Lorem.paragraph }
    unit_type { Faker::Types.rb_string }
    stock { Faker::Types.rb_integer }
    price { Faker::Number.decimal(l_digits: 2) }
    featured { Faker::Boolean.boolean }
    association :category, factory: :category
  end

  factory :category do
    description { Faker::Commerce.department(max: 1) }
  end
end
