class Product < ApplicationRecord

    validates :name, :price, :category, :stock, presence: true

    def self.filter_name(name_product)
        where(["name LIKE ?", "#{name_product}%"])
    end

    def self.sort_bi(sort)
        sort.blank? ? order(:id) : order(price: sort)
    end
end
