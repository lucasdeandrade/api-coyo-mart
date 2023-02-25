# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    validates :description, length: { minimum: 3 }, presence: true
end
