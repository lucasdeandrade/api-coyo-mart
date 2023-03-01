require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    before do
      FactoryBot.create_list(:product, 10)
      get '/products'
    end

    it 'returns all products' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      get products_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = FactoryBot.create(:product)
      get product_url(product)
      expect(response).to be_successful
    end
  end

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

      it 'return created' do
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

  describe 'PUT /update' do
    context 'with valid parameters' do
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

    context 'with invalid parameters' do
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

  describe 'DELETE /destroy' do
    let!(:my_product) { FactoryBot.create(:product) }

    before do
      delete "/products/#{my_product.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
