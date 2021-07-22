require 'rails_helper'

describe "Merchants API" do
  it "sends a list of Merchants" do
    create_list(:merchant, 20)

    get '/api/v1/merchants'

    expect(response).to be_successful
    require "pry"; binding.pry

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants.count).to eq(20)

    merchants.each do |merchant|
      #require "pry"; binding.pry
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an(Integer)

      expect(merchant).to have_key(:name)
      expect(merchant[:name]).to be_an(String)
    end
  end
end
