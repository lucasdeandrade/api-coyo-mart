class Product < ApplicationRecord

  belongs_to :category

  validates :name, :price, :category, :stock, presence: true

  def self.search_product(name_product)
    where(['name LIKE ?', "%#{name_product}%"])
  end

  def self.order_by_price(asc_or_desc)
    if %w[asc desc].include?(asc_or_desc)
      order(price: asc_or_desc)
    else
      order(:id)
    end
  end
end
