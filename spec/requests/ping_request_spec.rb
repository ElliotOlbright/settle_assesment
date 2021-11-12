require 'rails_helper'

RSpec.describe 'Get Ping' do
  it 'can return a succsessful ping' do 
    get "/api/ping"

    expect(response).to be_successful
    expect(response.status).to eq (200)

    ping = JSON.parse(response.body, symbolize_names: true)

    expect(ping[:success]).to eq("true")
  end 
end 