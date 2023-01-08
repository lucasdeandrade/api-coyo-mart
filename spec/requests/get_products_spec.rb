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
end
