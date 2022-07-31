require 'rails_helper'


RSpec.describe 'User', :type => :request do
  context 'POST users' do
    it 'successfully' do
      user_params = {user: {email: "rodolfo@email.com", password: "1234567", name: "Rodolfo Alves",
                     phone: '(47) 9 9474-7178', city: 'Pomerode', address: 'Rua Mafra, 247'}}
      post('/users', params: user_params)

      expect(response.status).to eq(201)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('User created successfully')
      expect(json_response['user']).to eq('Rodolfo Alves')
      expect(json_response['email']).to eq('rodolfo@email.com')
    end

    it 'with invalid data and its failed' do
      user_params = {user: {email: "", password: "1234567", name: "Rodolfo Alves",
                     phone: '(47) 9 9474-7178', city: '', address: 'Rua Mafra, 247'}}
      post('/users', params: user_params)

      expect(response.status).to eq(422)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Its failed')
      expect(json_response['errors']).to include("Email can't be blank")
      expect(json_response['errors']).to include("City can't be blank")
    end
  end
end