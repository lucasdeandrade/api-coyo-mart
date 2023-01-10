require 'rails_helper'

RSpec.describe 'Product', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_product) { FactoryBot.create(:product) }
      before do
        post '/products', params:
                          {
                            product: {
                              name: my_product.name,
                              description: my_product.description,
                              category_id: my_product.category_id,
                              unit_type: my_product.unit_type,
                              stock: my_product.stock,
                              price: my_product.price,
                              featured: my_product.featured
                            }
                          }
      end

      it 'returns the validates' do
        expect(json['name']).to eq(my_product.name)
        expect(json['price']).to eq(my_product.price)
        expect(json['category_id']).to eq(my_product.category_id)
        expect(json['stock']).to eq(my_product.stock)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/products', params:
                          {
                            product: {
                              name: '',
                              category: '',
                              stock: '',
                              price: ''
                            }
                          }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
