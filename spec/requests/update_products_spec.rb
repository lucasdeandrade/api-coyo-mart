require 'rails_helper'

RSpec.describe 'Product', type: :request do
  describe 'PUT /update' do
    let!(:my_product) { FactoryBot.create(:product) }

    before do
      post '/products', params:
                        {
                          product: {
                            name: my_product.name,
                            description: my_product.description,
                            category: my_product.category,
                            unit_type: my_product.unit_type,
                            stock: my_product.stock,
                            price: my_product.price,
                            featured: my_product.featured
                          }
                        }
      put "/products/#{my_product.id}", params:
                                        {
                                          product: {
                                            name: 'Lucas'
                                          }
                                        }
    end

    it 'returns update name' do
      expect(json['name']).to eq('Lucas')
    end

    it 'returns a put status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end
end
