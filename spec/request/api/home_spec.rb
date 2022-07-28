require 'rails_helper'

RSpec.describe 'Test API', :type => :request do
  context 'GET api/v1/' do
    it 'successfuly' do
      get('/api/v1/')
      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq("It's working!")
    end
  end
end