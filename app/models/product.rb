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
