require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validates" do
    it { is_expected.to validate_presence_of :description }
  end
  
end
