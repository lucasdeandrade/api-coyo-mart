require 'rails_helper'

RSpec.describe "/categories", type: :request do
  let!(:my_category) { FactoryBot.create(:category) }

  let(:valid_attributes) {
    { description: my_category.description }
  }

  let(:invalid_attributes) {
    { description: 'la' }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Category.create! valid_attributes
      get categories_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      category = Category.create! valid_attributes
      get category_url(category)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category" do
        expect {
          post categories_url,
               params: { category: valid_attributes }
        }.to change(Category, :count).by(1)
      end

      it "renders a JSON response with the new category" do
        post categories_url,
             params: { category: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Category" do
        expect {
          post categories_url,
               params: { category: invalid_attributes }
        }.to change(Category, :count).by(0)
      end

      it "renders a JSON response with errors for the new category" do
        post categories_url,
             params: { category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { description: 'teste' }
      }

      it "updates the requested category" do
        patch category_url(my_category),
              params: { category: new_attributes }
        my_category.reload
        expect(json['description']).to eq(new_attributes[:description])
      end

      it "renders a JSON response with the category" do
        patch category_url(my_category),
              params: { category: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the category" do
        patch category_url(my_category),
              params: { category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do

    context 'destroy category' do
      it "destroys the requested category" do
        expect {
          delete category_url(my_category)
        }.to change(Category, :count).by(-1)
      end
    end

    # context 'does not destroy category' do
    #   let!(:my_product) { FactoryBot.create(:product) }
      
    #   before do
    #     post '/products', params:
    #                       {
    #                         product: {
    #                           name: my_product.name,
    #                           description: my_product.description,
    #                           category: my_category.id,
    #                           unit_type: my_product.unit_type,
    #                           stock: my_product.stock,
    #                           price: my_product.price,
    #                           featured: my_product.featured
    #                         }
    #                       }
    #   end
    
    # context 'does not destroy category' do

    #   let!(:my_category2) { FactoryBot.create(:category) }
    #   let!(:my_product2) { FactoryBot.create(:product) }


    #   before do

    #     post '/products', params:
    #                       {
    #                         product: {
    #                           name: my_product2.name,
    #                           description: my_product2.description,
    #                           category: my_category2,
    #                           unit_type: my_product2.unit_type,
    #                           stock: my_product2.stock,
    #                           price: my_product2.price,
    #                           featured: my_product2.featured
    #                         }
    #                       }

    #     delete "/categories/#{my_category2.id}"
    #   end
    
    #   it 'não pode deletar categoria que contenha produtos' do
    #     expect(response).to have_http_status(:unprocessable_entity)
    #   end
    # end
  end
end
