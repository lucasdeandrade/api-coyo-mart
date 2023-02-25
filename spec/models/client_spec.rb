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
require 'rails_helper'

RSpec.describe Client, type: :model do
    context "validations" do
        it { is_expected.to validate_presence_of :name }
        it { is_expected.to validate_presence_of :cpf }
        it { is_expected.to validate_presence_of :email }
        it { is_expected.to validate_presence_of :phone }
        it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
        it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    end
end
