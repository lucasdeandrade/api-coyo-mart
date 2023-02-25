# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  description :text(65535)
#  unit_type   :string(255)
#  stock       :integer
#  price       :float(24)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  featured    :boolean
#  category_id :bigint           not null
#
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
