class Category < ApplicationRecord
    validates :description, length: { minimum: 3 }, presence: true
end
