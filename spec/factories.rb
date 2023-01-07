FactoryBot.define do
    factory :product do
      name { Faker::Name.name }
      description { Faker::Lorem.paragraph }
      category {Faker::Types.rb_string}
      unit_type {Faker::Types.rb_string}
      stock {Faker::Types.rb_integer}
      price {Faker::Number.decimal(l_digits: 2)}
      featured {Faker::Boolean.boolean}
    end
  end
