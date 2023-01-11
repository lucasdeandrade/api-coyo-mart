require 'rails_helper'

RSpec.describe 'Products', type: :request do
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