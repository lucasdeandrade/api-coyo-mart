FactoryBot.define do
    Faker::Config.locale = 'pt-BR'
    factory :client do
      name { Faker::Name.name }
      cpf { Faker::CPF.numeric }
      email { Faker::Internet.email }
      phone { Faker::PhoneNumber.cell_phone }
    end
end
