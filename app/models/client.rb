class Client < ApplicationRecord
    validates :name, :cpf, :email, :phone, presence: true
    validates :email, :cpf, uniqueness: true
end
