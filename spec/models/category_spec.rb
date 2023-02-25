# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validates" do
    it { is_expected.to validate_presence_of :description }
  end
  
end
