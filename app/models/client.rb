class Client < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_CPF_REGEX = /([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/i

    validates :name, :cpf, :email, :phone, presence: true
    validates :email, :cpf, uniqueness: true
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :cpf, format: { with: VALID_CPF_REGEX }
end
