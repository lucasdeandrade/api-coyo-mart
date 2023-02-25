# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  cpf        :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Client < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_CPF_REGEX = /([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/i

    validates :name, :cpf, :email, :phone, presence: true
    validates :email, uniqueness: true
    validates :cpf, uniqueness: true
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :cpf, format: { with: VALID_CPF_REGEX }
end
