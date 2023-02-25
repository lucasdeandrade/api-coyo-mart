require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:invalid_attributes) do
    {
      name: '',
      cpf: '',
      email: '',
      phone: ''
    }
  end

  describe 'GET /clients' do
    before do
      FactoryBot.create_list(:client, 3)
      get '/clients'
    end

    it 'returns all clients' do
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      get clients_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      client = FactoryBot.create(:client)
      get client_url(client)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:my_client) { FactoryBot.create(:client) }
      before do
        post '/clients', params: { client:
        {
          name: my_client.name,
          cpf: '55566677789',
          email: 'hfj@hdjd.com',
          phone: my_client.phone
        } }
      end

      it 'renders a JSON response with the new client' do
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Client' do
        expect do
          post clients_url,
               params: { client: invalid_attributes }, as: :json
        end.to change(Client, :count).by(0)
      end

      it 'renders a JSON response with errors for the new client' do
        post clients_url,
             params: { client: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:my_client) { FactoryBot.create(:client) }
      before do
        post '/clients', params: { client:
                                  {
                                    name: my_client.name,
                                    cpf: '55566677789',
                                    email: 'hfj@hdjd.com',
                                    phone: my_client.phone
                                  } }

        put "/clients/#{my_client.id}", params: { client:
                                                  {
                                                    name: 'Lucas'
                                                  } }
      end
      it 'returns update name' do
        expect(json['name']).to eq('Lucas')
      end

      it 'returns a put status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:my_client) { FactoryBot.create(:client) }

    before do
      delete "/clients/#{my_client.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
