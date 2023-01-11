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