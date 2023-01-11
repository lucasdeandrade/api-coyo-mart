require 'rails_helper'

RSpec.describe Product, type: :model do
    context "validations" do
        it { is_expected.to validate_presence_of :name }
        it { is_expected.to validate_presence_of :price }
        it { is_expected.to validate_presence_of :category }
        it { is_expected.to validate_presence_of :stock }
    end
    context "associations" do
        it { is_expected.to belong_to(:category) }
    end
    
end